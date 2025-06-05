from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import Idioma
from schemas.idioma import IdiomaCreate, IdiomaResponse

router = APIRouter()

@router.post("/", response_model=IdiomaResponse)
def create_idioma(idioma: IdiomaCreate, db: Session = Depends(get_db)):
    try:
        db_idioma = Idioma(nombre=idioma.nombre)
        db.add(db_idioma)
        db.commit()
        db.refresh(db_idioma)
        return db_idioma
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/", response_model=List[IdiomaResponse])
def get_idiomas(db: Session = Depends(get_db)):
    return db.query(Idioma).all()

@router.get("/{id_idioma}", response_model=IdiomaResponse)
def get_idioma(id_idioma: int, db: Session = Depends(get_db)):
    idioma = db.query(Idioma).filter(Idioma.id_idioma == id_idioma).first()
    if idioma is None:
        raise HTTPException(status_code=404, detail="Idioma no encontrado")
    return idioma

@router.delete("/{id_idioma}")
def delete_idioma(id_idioma: int, db: Session = Depends(get_db)):
    idioma = db.query(Idioma).filter(Idioma.id_idioma == id_idioma).first()
    if idioma is None:
        raise HTTPException(status_code=404, detail="Idioma no encontrado")
    try:
        db.delete(idioma)
        db.commit()
        return {"message": "Idioma eliminado exitosamente"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e)) 