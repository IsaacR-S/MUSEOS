from pydantic import BaseModel

class EstructuraFisicaResponse(BaseModel):
    id_estructura_fisica: int
    nombre: str
    id_museo: int

    class Config:
        from_attributes = True 