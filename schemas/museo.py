from pydantic import BaseModel
from datetime import date
from typing import Optional

class MuseoBase(BaseModel):
    nombre: str
    mision: Optional[str] = None
    fecha_fundacion: date
    id_lugar: int

class MuseoCreate(MuseoBase):
    pass

class MuseoResponse(MuseoBase):
    id_museo: int

    class Config:
        from_attributes = True 