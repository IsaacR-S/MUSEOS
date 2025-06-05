from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import Lugar
from pydantic import BaseModel
from typing import Optional

router = APIRouter()

class LugarBase(BaseModel):
    nombre_lugar: str
    tipo: str
    id_jerarquia: Optional[int] = None

class LugarCreate(LugarBase):
    pass

class LugarResponse(LugarBase):
    id_lugar: int

    class Config:
        from_attributes = True

@router.post("/", response_model=LugarResponse)
def create_lugar(lugar: LugarCreate, db: Session = Depends(get_db)):
    db_lugar = Lugar(
        nombre_lugar=lugar.nombre_lugar,
        tipo=lugar.tipo,
        id_jerarquia=lugar.id_jerarquia
    )
    
    try:
        db.add(db_lugar)
        db.commit()
        db.refresh(db_lugar)
        return db_lugar
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/", response_model=List[LugarResponse])
def get_lugares(db: Session = Depends(get_db)):
    return db.query(Lugar).all()

@router.get("/{id_lugar}", response_model=LugarResponse)
def get_lugar(id_lugar: int, db: Session = Depends(get_db)):
    lugar = db.query(Lugar).filter(Lugar.id_lugar == id_lugar).first()
    if lugar is None:
        raise HTTPException(status_code=404, detail="Lugar no encontrado")
    return lugar

@router.put("/{id_lugar}", response_model=LugarResponse)
def update_lugar(id_lugar: int, lugar_update: LugarCreate, db: Session = Depends(get_db)):
    lugar = db.query(Lugar).filter(Lugar.id_lugar == id_lugar).first()
    if lugar is None:
        raise HTTPException(status_code=404, detail="Lugar no encontrado")
        
    for key, value in lugar_update.dict().items():
        setattr(lugar, key, value)
        
    try:
        db.commit()
        db.refresh(lugar)
        return lugar
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.delete("/{id_lugar}")
def delete_lugar(id_lugar: int, db: Session = Depends(get_db)):
    lugar = db.query(Lugar).filter(Lugar.id_lugar == id_lugar).first()
    if lugar is None:
        raise HTTPException(status_code=404, detail="Lugar no encontrado")
        
    try:
        db.delete(lugar)
        db.commit()
        return {"message": "Lugar eliminado exitosamente"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e)) 