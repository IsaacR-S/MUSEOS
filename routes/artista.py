from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import Artista
from schemas.artista import ArtistaCreate, ArtistaResponse

router = APIRouter()

@router.get("/artistas", response_model=List[ArtistaResponse])
def listar_artistas(db: Session = Depends(get_db)):
    return db.query(Artista).all()

@router.post("/artistas", response_model=ArtistaResponse)
def crear_artista(artista: ArtistaCreate, db: Session = Depends(get_db)):
    nuevo = Artista(**artista.dict())
    db.add(nuevo)
    db.commit()
    db.refresh(nuevo)
    return nuevo 