from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import EstructuraOrganizacional

router = APIRouter()

@router.get("/estructuras-org/{id_museo}", response_model=List[dict])
def get_estructuras_org(id_museo: int, db: Session = Depends(get_db)):
    estructuras = db.query(EstructuraOrganizacional).filter(EstructuraOrganizacional.id_museo == id_museo).all()
    return [
        {
            "id_estructura_org": e.id_estructura_org,
            "nombre": e.nombre,
            "nivel": e.nivel,
            "tipo": e.tipo
        } for e in estructuras
    ] 