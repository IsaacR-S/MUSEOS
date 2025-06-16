from pydantic import BaseModel
from datetime import date
from typing import Optional, List
from .formacion_profesional import FormacionProfesionalCreate, FormacionProfesionalResponse
from .idioma import IdiomaResponse

class EstructuraOrganizacionalResponse(BaseModel):
    id_museo: int
    id_estructura_org: int
    nombre: str
    nivel: str
    tipo: str
    id_jerarquia_estructura: Optional[int] = None
    id_jerarquia_museo: Optional[int] = None

    class Config:
        from_attributes = True

class HistoricoEmpleadoCreate(BaseModel):
    id_museo: int
    id_estructura_org: int
    fecha_inicio: date
    rol_empleado: str

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
    historico: HistoricoEmpleadoCreate

class EmpleadoProfesionalResponse(EmpleadoProfesionalBase):
    id_empleado_prof: int
    formaciones: List[FormacionProfesionalResponse] = []
    idiomas: List[IdiomaResponse] = []

    class Config:
        from_attributes = True 