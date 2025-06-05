from pydantic import BaseModel
from datetime import date
from typing import Optional, List
from .formacion_profesional import FormacionProfesionalCreate, FormacionProfesionalResponse
from .idioma import IdiomaResponse

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
    idiomas: Optional[List[int]] = None  # Lista de IDs de idiomas

class EmpleadoProfesionalResponse(EmpleadoProfesionalBase):
    id_empleado_prof: int
    formaciones: List[FormacionProfesionalResponse] = []
    idiomas: List[IdiomaResponse] = []

    class Config:
        from_attributes = True 