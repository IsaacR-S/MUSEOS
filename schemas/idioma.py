from pydantic import BaseModel

class IdiomaBase(BaseModel):
    nombre: str

class IdiomaCreate(IdiomaBase):
    pass

class IdiomaResponse(IdiomaBase):
    id_idioma: int

    class Config:
        from_attributes = True 