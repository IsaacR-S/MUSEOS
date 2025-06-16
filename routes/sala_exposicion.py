from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import SalaExposicion
from schemas.sala_exposicion import SalaExposicionResponse

router = APIRouter()

@router.get("/salas/{id_museo}/{id_estructura_fisica}", response_model=List[SalaExposicionResponse])
def get_salas(id_museo: int, id_estructura_fisica: int, db: Session = Depends(get_db)):
    return db.query(SalaExposicion).filter(
        SalaExposicion.id_museo == id_museo,
        SalaExposicion.id_estructura_fisica == id_estructura_fisica
    ).all() 