from fastapi import APIRouter, HTTPException, Depends, Body
from sqlalchemy.orm import Session
from typing import List, Dict
from database import get_db
from models.database_models import Obra, art_obra, HistoricoObraMovimiento
from schemas.obra import ObraCreate, ObraResponse, HistoricoObraMovimientoCreate, HistoricoObraMovimientoResponse

router = APIRouter()

@router.post("/", response_model=ObraResponse)
def create_obra(obra: ObraCreate, db: Session = Depends(get_db)):
    db_obra = Obra(
        nombre_obra=obra.nombre_obra,
        fecha_periodo=obra.fecha_periodo,
        tipo_obra=obra.tipo_obra,
        dimensiones=obra.dimensiones,
        estilo_descripcion=obra.estilo_descripcion,
        descripcion_materiales_tecnicas=obra.descripcion_materiales_tecnicas
    )
    
    try:
        db.add(db_obra)
        db.commit()
        db.refresh(db_obra)
        return db_obra
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/", response_model=List[ObraResponse])
def get_obras(db: Session = Depends(get_db)):
    obras = db.query(Obra).all()
    return obras

@router.get("/{id_obra}", response_model=ObraResponse)
def get_obra(id_obra: int, db: Session = Depends(get_db)):
    obra = db.query(Obra).filter(Obra.id_obra == id_obra).first()
    if obra is None:
        raise HTTPException(status_code=404, detail="Obra no encontrada")
    return obra

@router.put("/{id_obra}", response_model=ObraResponse)
def update_obra(id_obra: int, obra_update: ObraCreate, db: Session = Depends(get_db)):
    obra = db.query(Obra).filter(Obra.id_obra == id_obra).first()
    if obra is None:
        raise HTTPException(status_code=404, detail="Obra no encontrada")
    
    for key, value in obra_update.dict().items():
        setattr(obra, key, value)
    
    try:
        db.commit()
        db.refresh(obra)
        return obra
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.delete("/{id_obra}")
def delete_obra(id_obra: int, db: Session = Depends(get_db)):
    obra = db.query(Obra).filter(Obra.id_obra == id_obra).first()
    if obra is None:
        raise HTTPException(status_code=404, detail="Obra no encontrada")
    
    try:
        db.delete(obra)
        db.commit()
        return {"message": "Obra eliminada exitosamente"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.post("/{id_obra}/artistas")
def asignar_artistas_obra(id_obra: int, data: Dict = Body(...), db: Session = Depends(get_db)):
    id_artistas = data.get('id_artistas', [])
    for id_artista in id_artistas:
        db.execute(art_obra.insert().values(id_obra=id_obra, id_artista=id_artista))
    db.commit()
    return {"msg": "Artistas asignados"}

@router.post("/historico-obra-movimiento/", response_model=HistoricoObraMovimientoResponse)
def crear_historico_obra_movimiento(mov: HistoricoObraMovimientoCreate, db: Session = Depends(get_db)):
    db_mov = HistoricoObraMovimiento(**mov.dict())
    try:
        db.add(db_mov)
        db.commit()
        db.refresh(db_mov)
        return db_mov
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e)) 