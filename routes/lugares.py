from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List, Optional
from pydantic import BaseModel
from database import get_db
from models.lugar import Lugar
from sqlalchemy.exc import IntegrityError

router = APIRouter()

class LugarBase(BaseModel):
    nombre_lugar: str
    tipo: str
    id_jerarquia: Optional[int] = None

class LugarCreate(LugarBase):
    pass

class LugarUpdate(LugarBase):
    pass

class LugarResponse(LugarBase):
    id_lugar: int
    jerarquia_nombre: Optional[str] = None

    class Config:
        from_attributes = True

@router.get("/", response_model=List[LugarResponse])
def get_lugares(db: Session = Depends(get_db)):
    lugares = db.query(Lugar).all()
    for lugar in lugares:
        if lugar.jerarquia:
            lugar.jerarquia_nombre = lugar.jerarquia.nombre_lugar
    return lugares

@router.post("/", response_model=LugarResponse)
def create_lugar(lugar: LugarCreate, db: Session = Depends(get_db)):
    db_lugar = Lugar(**lugar.model_dump())
    db.add(db_lugar)
    try:
        db.commit()
        db.refresh(db_lugar)
    except IntegrityError as e:
        db.rollback()
        if 'fk_jerarquia' in str(e):
            raise HTTPException(status_code=400, detail="El lugar jerárquico especificado no existe")
        raise HTTPException(status_code=400, detail="Error de integridad en la base de datos")
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))
    return db_lugar

@router.put("/{id_lugar}", response_model=LugarResponse)
def update_lugar(id_lugar: int, lugar: LugarUpdate, db: Session = Depends(get_db)):
    db_lugar = db.query(Lugar).filter(Lugar.id_lugar == id_lugar).first()
    if not db_lugar:
        raise HTTPException(status_code=404, detail="Lugar no encontrado")
    
    for key, value in lugar.model_dump().items():
        setattr(db_lugar, key, value)
    
    try:
        db.commit()
        db.refresh(db_lugar)
    except IntegrityError as e:
        db.rollback()
        if 'fk_jerarquia' in str(e):
            raise HTTPException(status_code=400, detail="El lugar jerárquico especificado no existe")
        raise HTTPException(status_code=400, detail="Error de integridad en la base de datos")
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))
    return db_lugar

@router.delete("/{id_lugar}")
def delete_lugar(id_lugar: int, db: Session = Depends(get_db)):
    # Primero verificamos si el lugar existe
    db_lugar = db.query(Lugar).filter(Lugar.id_lugar == id_lugar).first()
    if not db_lugar:
        raise HTTPException(status_code=404, detail="Lugar no encontrado")
    
    # Verificar si hay lugares que dependen de este
    lugares_dependientes = db.query(Lugar).filter(Lugar.id_jerarquia == id_lugar).all()
    if lugares_dependientes:
        lugares_nombres = [l.nombre_lugar for l in lugares_dependientes]
        raise HTTPException(
            status_code=400,
            detail=f"No se puede eliminar este lugar porque los siguientes lugares dependen de él: {', '.join(lugares_nombres)}"
        )

    # Verificar si hay museos que referencian este lugar
    try:
        db.execute("SELECT 1 FROM museo WHERE id_lugar = :id", {"id": id_lugar})
        result = db.fetchone()
        if result:
            raise HTTPException(
                status_code=400,
                detail="No se puede eliminar este lugar porque está siendo utilizado por uno o más museos"
            )
    except Exception:
        pass

    try:
        db.delete(db_lugar)
        db.commit()
        return {"message": "Lugar eliminado exitosamente"}
    except IntegrityError as e:
        db.rollback()
        error_msg = str(e)
        if 'fk_lugar' in error_msg:
            raise HTTPException(
                status_code=400,
                detail="No se puede eliminar este lugar porque está siendo utilizado por uno o más museos"
            )
        elif 'fk_jerarquia' in error_msg:
            raise HTTPException(
                status_code=400,
                detail="No se puede eliminar este lugar porque otros lugares dependen de él"
            )
        raise HTTPException(status_code=400, detail="Error de integridad en la base de datos")
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e)) 