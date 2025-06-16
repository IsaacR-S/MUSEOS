from pydantic import BaseModel
from typing import Optional, List
from datetime import date

class ResumenHistCreate(BaseModel):
    ano: date
    hechos_hist: str

class MuseoBase(BaseModel):
    nombre: str
    mision: Optional[str] = None
    fecha_fundacion: date
    id_lugar: int

class MuseoCreate(MuseoBase):
    resumenes_hist: Optional[List[ResumenHistCreate]] = []

class MuseoResponse(MuseoBase):
    id_museo: int

    class Config:
        from_attributes = True 