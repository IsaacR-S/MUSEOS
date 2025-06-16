from pydantic import BaseModel
from typing import Optional
from datetime import date

class ObraBase(BaseModel):
    nombre_obra: str
    fecha_periodo: str
    tipo_obra: str
    dimensiones: str
    estilo_descripcion: str
    descripcion_materiales_tecnicas: str

class ObraCreate(ObraBase):
    pass

class ObraResponse(ObraBase):
    id_obra: int

    class Config:
        from_attributes = True

# --- Esquema para el movimiento histórico de obra ---
class HistoricoObraMovimientoBase(BaseModel):
    id_obra: int
    fecha_inicio: date
    tipo_obtencion: str
    destacada: str
    id_museo_sala: int
    id_estructura_fisica: int
    id_sala: int
    id_museo_coleccion: int
    id_estructura_org_coleccion: int
    id_coleccion: int
    id_museo_empleado: int
    id_estructura_org_empleado: int
    id_empleado: int
    fecha_inicio_empleado: date
    valor_obra: float
    orden_recomendado: Optional[int] = None
    fecha_fin: Optional[date] = None

class HistoricoObraMovimientoCreate(HistoricoObraMovimientoBase):
    pass

class HistoricoObraMovimientoResponse(HistoricoObraMovimientoBase):
    id_historico_obra_movimiento: int

    class Config:
        from_attributes = True 