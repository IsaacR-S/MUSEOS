from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import Museo, ResumenHist
from schemas.museo import MuseoCreate, MuseoResponse, ResumenHistCreate
from datetime import datetime

router = APIRouter()

@router.post("/", response_model=MuseoResponse)
def create_museo(museo: MuseoCreate, db: Session = Depends(get_db)):
    db_museo = Museo(
        nombre=museo.nombre,
        mision=museo.mision,
        fecha_fundacion=museo.fecha_fundacion,
        id_lugar=museo.id_lugar
    )
    db.add(db_museo)
    db.flush()  # Para obtener el id_museo
    # Registrar resúmenes históricos si vienen
    if museo.resumenes_hist:
        for resumen in museo.resumenes_hist:
            db_resumen = ResumenHist(
                id_museo=db_museo.id_museo,
                ano=resumen.ano,
                hechos_hist=resumen.hechos_hist
            )
            db.add(db_resumen)
    db.commit()
    db.refresh(db_museo)
    return db_museo

@router.get("/", response_model=List[MuseoResponse])
def get_museos(db: Session = Depends(get_db)):
    return db.query(Museo).all()

@router.get("/{id_museo}", response_model=MuseoResponse)
def get_museo(id_museo: int, db: Session = Depends(get_db)):
    museo = db.query(Museo).filter(Museo.id_museo == id_museo).first()
    if museo is None:
        raise HTTPException(status_code=404, detail="Museo no encontrado")
    return museo

@router.put("/{id_museo}", response_model=MuseoResponse)
def update_museo(id_museo: int, museo_update: MuseoCreate, db: Session = Depends(get_db)):
    museo = db.query(Museo).filter(Museo.id_museo == id_museo).first()
    if museo is None:
        raise HTTPException(status_code=404, detail="Museo no encontrado")
        
    for key, value in museo_update.dict().items():
        setattr(museo, key, value)
        
    try:
        db.commit()
        db.refresh(museo)
        return museo
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.delete("/{id_museo}")
def delete_museo(id_museo: int, db: Session = Depends(get_db)):
    museo = db.query(Museo).filter(Museo.id_museo == id_museo).first()
    if museo is None:
        raise HTTPException(status_code=404, detail="Museo no encontrado")
        
    try:
        db.delete(museo)
        db.commit()
        return {"message": "Museo eliminado exitosamente"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.post("/{id_museo}/resumenes", response_model=list)
def agregar_resumenes_a_museo(id_museo: int, resumenes: List[ResumenHistCreate], db: Session = Depends(get_db)):
    nuevos = []
    for resumen in resumenes:
        db_resumen = ResumenHist(
            id_museo=id_museo,
            ano=resumen.ano,
            hechos_hist=resumen.hechos_hist
        )
        db.add(db_resumen)
        nuevos.append({"ano": resumen.ano, "hechos_hist": resumen.hechos_hist})
    db.commit()
    return nuevos 