from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import EstructuraFisica
from schemas.estructura_fisica import EstructuraFisicaResponse

router = APIRouter()

@router.get("/estructuras-fisicas/{id_museo}", response_model=List[EstructuraFisicaResponse])
def get_estructuras_fisicas(id_museo: int, db: Session = Depends(get_db)):
    return db.query(EstructuraFisica).filter(EstructuraFisica.id_museo == id_museo).all() 