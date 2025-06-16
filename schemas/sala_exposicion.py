from pydantic import BaseModel

class SalaExposicionResponse(BaseModel):
    id_sala: int
    nombre_sala: str
    id_estructura_fisica: int
    id_museo: int

    class Config:
        from_attributes = True 