from pydantic import BaseModel
from typing import Optional

class ObraBase(BaseModel):
    nombre_obra: str
    fecha_periodo: str
    tipo_obra: str
    dimensiones: str
    estilo_descripcion: str
    descripcion_materiales_tecnicas: str

class ObraCreate(ObraBase):
    pass

class ObraResponse(ObraBase):
    id_obra: int

    class Config:
        from_attributes = True 