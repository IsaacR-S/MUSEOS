from pydantic import BaseModel
from datetime import date

class ResumenHistBase(BaseModel):
    ano: date
    hechos_hist: str
    id_museo: int

class ResumenHistCreate(ResumenHistBase):
    pass

class ResumenHistResponse(ResumenHistBase):
    class Config:
        from_attributes = True 