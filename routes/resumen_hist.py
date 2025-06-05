from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import ResumenHist
from schemas.resumen_hist import ResumenHistCreate, ResumenHistResponse

router = APIRouter()

@router.post("/", response_model=ResumenHistResponse)
def create_resumen_hist(resumen: ResumenHistCreate, db: Session = Depends(get_db)):
    db_resumen = ResumenHist(
        id_museo=resumen.id_museo,
        ano=resumen.ano,
        hechos_hist=resumen.hechos_hist
    )
    
    try:
        db.add(db_resumen)
        db.commit()
        db.refresh(db_resumen)
        return db_resumen
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/museo/{id_museo}", response_model=List[ResumenHistResponse])
def get_resumenes_by_museo(id_museo: int, db: Session = Depends(get_db)):
    resumenes = db.query(ResumenHist).filter(ResumenHist.id_museo == id_museo).order_by(ResumenHist.ano).all()
    return resumenes

@router.get("/{id_museo}/{ano}", response_model=ResumenHistResponse)
def get_resumen(id_museo: int, ano: str, db: Session = Depends(get_db)):
    resumen = db.query(ResumenHist).filter(
        ResumenHist.id_museo == id_museo,
        ResumenHist.ano == ano
    ).first()
    
    if resumen is None:
        raise HTTPException(status_code=404, detail="Resumen histórico no encontrado")
    return resumen

@router.put("/{id_museo}/{ano}", response_model=ResumenHistResponse)
def update_resumen(
    id_museo: int,
    ano: str,
    resumen_update: ResumenHistCreate,
    db: Session = Depends(get_db)
):
    resumen = db.query(ResumenHist).filter(
        ResumenHist.id_museo == id_museo,
        ResumenHist.ano == ano
    ).first()
    
    if resumen is None:
        raise HTTPException(status_code=404, detail="Resumen histórico no encontrado")
    
    resumen.hechos_hist = resumen_update.hechos_hist
    
    try:
        db.commit()
        db.refresh(resumen)
        return resumen
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.delete("/{id_museo}/{ano}")
def delete_resumen(id_museo: int, ano: str, db: Session = Depends(get_db)):
    resumen = db.query(ResumenHist).filter(
        ResumenHist.id_museo == id_museo,
        ResumenHist.ano == ano
    ).first()
    
    if resumen is None:
        raise HTTPException(status_code=404, detail="Resumen histórico no encontrado")
    
    try:
        db.delete(resumen)
        db.commit()
        return {"message": "Resumen histórico eliminado exitosamente"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e)) 