from typing import Optional
from pydantic import BaseModel, constr
from datetime import date

class MuseoBase(BaseModel):
    nombre: constr(max_length=50)
    mision: Optional[constr(max_length=350)] = None
    fecha_fundacion: date
    id_lugar: int

class MuseoCreate(MuseoBase):
    pass

class MuseoUpdate(MuseoBase):
    pass

class Museo(MuseoBase):
    id_museo: int

    class Config:
        from_attributes = True 