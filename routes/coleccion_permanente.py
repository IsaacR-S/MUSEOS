from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import ColeccionPermanente
from schemas.coleccion_permanente import ColeccionPermanenteResponse

router = APIRouter()

@router.get("/colecciones/{id_museo}/{id_estructura_org}", response_model=List[ColeccionPermanenteResponse])
def get_colecciones(id_museo: int, id_estructura_org: int, db: Session = Depends(get_db)):
    return db.query(ColeccionPermanente).filter(
        ColeccionPermanente.id_museo == id_museo,
        ColeccionPermanente.id_estructura_org == id_estructura_org
    ).all() 