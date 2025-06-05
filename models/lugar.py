from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

class Lugar(Base):
    __tablename__ = "lugar"

    id_lugar = Column(Integer, primary_key=True, index=True)
    nombre_lugar = Column(String, nullable=False)
    tipo = Column(String, nullable=False)
    id_jerarquia = Column(Integer, ForeignKey("lugar.id_lugar", name="fk_jerarquia"), nullable=True)

    # Relación consigo mismo para la jerarquía
    jerarquia = relationship("Lugar", remote_side=[id_lugar], backref="lugares_dependientes") 