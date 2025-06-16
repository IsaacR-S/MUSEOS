from pydantic import BaseModel
from typing import Optional
from datetime import date

class ArtistaBase(BaseModel):
    nombre_artista: str
    apellido_artista: str
    fecha_nacimiento: Optional[date] = None
    apodo_artista: Optional[str] = None
    fecha_muerte: Optional[date] = None
    descripcion_estilo_tecnicas: str

class ArtistaCreate(ArtistaBase):
    pass

class ArtistaResponse(ArtistaBase):
    id_artista: int

    class Config:
        orm_mode = True 