from pydantic import BaseModel
from datetime import date
from typing import Optional, List
from .formacion_profesional import FormacionProfesionalCreate, FormacionProfesionalResponse

class EmpleadoProfesionalBase(BaseModel):
    primer_nombre: str
    primer_apellido: str
    segundo_apellido: str
    fecha_nacimiento: date
    doc_identidad: int
    dato_contacto: Optional[str] = None
    segundo_nombre: Optional[str] = None

class EmpleadoProfesionalCreate(EmpleadoProfesionalBase):
    formaciones: Optional[List[FormacionProfesionalCreate]] = None

class EmpleadoProfesionalResponse(EmpleadoProfesionalBase):
    id_empleado_prof: int
    formaciones: List[FormacionProfesionalResponse] = []

    class Config:
        from_attributes = True 