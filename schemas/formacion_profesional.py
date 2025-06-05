from pydantic import BaseModel
from datetime import date
from typing import Optional

class FormacionProfesionalBase(BaseModel):
    nombre_titulo: str
    ano: date
    descripcion_especialidad: str

class FormacionProfesionalCreate(FormacionProfesionalBase):
    pass

class FormacionProfesionalResponse(FormacionProfesionalBase):
    id_empleado_prof: int
    id_formacion: int

    class Config:
        from_attributes = True 