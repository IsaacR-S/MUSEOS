from pydantic import BaseModel

class ColeccionPermanenteResponse(BaseModel):
    id_coleccion: int
    nombre_coleccion: str
    id_estructura_org: int
    id_museo: int

    class Config:
        from_attributes = True 