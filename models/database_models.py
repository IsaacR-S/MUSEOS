from sqlalchemy import Column, Integer, String, Date, ForeignKey, Numeric, CheckConstraint, MetaData, text, Table
from sqlalchemy.orm import relationship
from database import Base

metadata = MetaData()

# Tabla intermedia para la relación muchos a muchos entre Obra y Artista
art_obra = Table(
    'art_obra',
    Base.metadata,
    Column('id_artista', Numeric, ForeignKey('artista.id_artista'), primary_key=True),
    Column('id_obra', Numeric, ForeignKey('obra.id_obra'), primary_key=True)
)

class EmpleadoProfesional(Base):
    __tablename__ = "empleado_profesional"
    __table_args__ = {'extend_existing': True}

    id_empleado_prof = Column(Numeric, primary_key=True)
    primer_nombre = Column(String(20), nullable=False)
    primer_apellido = Column(String(20), nullable=False)
    segundo_apellido = Column(String(20), nullable=False)
    fecha_nacimiento = Column(Date, nullable=False)
    doc_identidad = Column(Numeric, nullable=False)
    dato_contacto = Column(String(100))
    segundo_nombre = Column(String(20))

    # Relationships
    formaciones = relationship("FormacionProfesional", back_populates="empleado", cascade="all, delete-orphan")
    idiomas = relationship("Idioma", secondary="emp_idi", back_populates="empleados")

class FormacionProfesional(Base):
    __tablename__ = "formacion_profesional"
    __table_args__ = {'extend_existing': True}

    id_empleado_prof = Column(Numeric, ForeignKey('empleado_profesional.id_empleado_prof'), primary_key=True)
    id_formacion = Column(Numeric, primary_key=True)
    nombre_titulo = Column(String(100), nullable=False)
    ano = Column(Date, nullable=False)
    descripcion_especialidad = Column(String(200), nullable=False)

    # Relationships
    empleado = relationship("EmpleadoProfesional", back_populates="formaciones")

class Idioma(Base):
    __tablename__ = "idioma"
    __table_args__ = {'extend_existing': True}

    id_idioma = Column(Numeric, primary_key=True)
    nombre = Column(String(50), nullable=False)

    # Relationships
    empleados = relationship("EmpleadoProfesional", secondary="emp_idi", back_populates="idiomas")

class EmpleadoIdioma(Base):
    __tablename__ = "emp_idi"
    __table_args__ = {'extend_existing': True}

    id_idioma = Column(Numeric, ForeignKey('idioma.id_idioma'), primary_key=True)
    id_empleado_prof = Column(Numeric, ForeignKey('empleado_profesional.id_empleado_prof'), primary_key=True)

class Artista(Base):
    __tablename__ = "artista"
    __table_args__ = {'extend_existing': True}

    id_artista = Column(Numeric, primary_key=True)
    nombre_artista = Column(String(60))
    apellido_artista = Column(String(60))
    fecha_nacimiento = Column(Date)
    apodo_artista = Column(String(60))
    fecha_muerte = Column(Date)
    descripcion_estilo_tecnicas = Column(String(300), nullable=False)

    # Relationships
    obras = relationship("Obra", secondary=art_obra, back_populates="artistas")

class Obra(Base):
    __tablename__ = "obra"
    __table_args__ = (
        CheckConstraint("tipo_obra IN ('pintura', 'escultura')", name='ch_tipo_obra'),
        {'extend_existing': True}
    )

    id_obra = Column(Numeric, primary_key=True)
    nombre_obra = Column(String(250), nullable=False)
    fecha_periodo = Column(String(100), nullable=False)
    tipo_obra = Column(String(9), nullable=False)
    dimensiones = Column(String(80), nullable=False)
    estilo_descripcion = Column(String(80), nullable=False)
    descripcion_materiales_tecnicas = Column(String(300), nullable=False)

    # Relationships
    artistas = relationship("Artista", secondary=art_obra, back_populates="obras")

class Lugar(Base):
    __tablename__ = "lugar"

    id_lugar = Column(Numeric, primary_key=True)
    nombre_lugar = Column(String(50), nullable=False)
    tipo = Column(String(20))
    id_jerarquia = Column(Numeric, ForeignKey('lugar.id_lugar'))
    
    # Relationships
    museos = relationship("Museo", back_populates="lugar")

    __table_args__ = (
        CheckConstraint("tipo IN ('ciudad', 'pais')", name='ch_tipo'),
        {'extend_existing': True}
    )

class Museo(Base):
    __tablename__ = "museo"
    __table_args__ = {'extend_existing': True}

    id_museo = Column(Numeric, primary_key=True)
    nombre = Column(String(50), nullable=False)
    mision = Column(String(350))
    fecha_fundacion = Column(Date, nullable=False)
    id_lugar = Column(Numeric, ForeignKey('lugar.id_lugar'), nullable=False)

    # Relationships
    lugar = relationship("Lugar", back_populates="museos")
    resumenes_historicos = relationship("ResumenHist", back_populates="museo")

class ResumenHist(Base):
    __tablename__ = "resumen_hist"
    __table_args__ = {'extend_existing': True}

    id_museo = Column(Numeric, ForeignKey('museo.id_museo'), primary_key=True)
    ano = Column(Date, primary_key=True)
    hechos_hist = Column(String(350), nullable=False)

    # Relationships
    museo = relationship("Museo", back_populates="resumenes_historicos")

class EstructuraOrganizacional(Base):
    __tablename__ = "estructura_organizacional"
    __table_args__ = {'extend_existing': True}

    id_museo = Column(Numeric, ForeignKey('museo.id_museo'), primary_key=True)
    id_estructura_org = Column(Numeric, primary_key=True)
    nombre = Column(String(100), nullable=False)
    nivel = Column(String(50), nullable=False)
    tipo = Column(String(50), nullable=False)
    id_jerarquia_estructura = Column(Numeric, nullable=True)
    id_jerarquia_museo = Column(Numeric, nullable=True)

    # Relaciones
    museo = relationship("Museo")

class HistoricoEmpleado(Base):
    __tablename__ = "historico_empleado"
    __table_args__ = {'extend_existing': True}

    id_empleado = Column(Numeric, ForeignKey('empleado_profesional.id_empleado_prof'), primary_key=True)
    id_museo = Column(Numeric, ForeignKey('museo.id_museo'), primary_key=True)
    id_estructura_org = Column(Numeric, ForeignKey('estructura_organizacional.id_estructura_org'), primary_key=True)
    fecha_inicio = Column(Date, primary_key=True)
    rol_empleado = Column(String(70), nullable=False)
    fecha_fin = Column(Date, nullable=True)

    # Relaciones
    empleado = relationship("EmpleadoProfesional")
    museo = relationship("Museo")
    estructura = relationship("EstructuraOrganizacional")

class HistoricoObraMovimiento(Base):
    __tablename__ = "historico_obra_movimiento"
    __table_args__ = {'extend_existing': True}

    id_obra = Column(Numeric, primary_key=True)
    id_historico_obra_movimiento = Column(Numeric, primary_key=True, autoincrement=True)
    fecha_inicio = Column(Date, nullable=False)
    tipo_obtencion = Column(String, nullable=False)
    destacada = Column(String(2), nullable=False)
    id_museo_sala = Column(Numeric, nullable=False)
    id_estructura_fisica = Column(Numeric, nullable=False)
    id_sala = Column(Numeric, nullable=False)
    id_museo_coleccion = Column(Numeric, nullable=False)
    id_estructura_org_coleccion = Column(Numeric, nullable=False)
    id_coleccion = Column(Numeric, nullable=False)
    id_museo_empleado = Column(Numeric, nullable=False)
    id_estructura_org_empleado = Column(Numeric, nullable=False)
    id_empleado = Column(Numeric, nullable=False)
    fecha_inicio_empleado = Column(Date, nullable=False)
    fecha_fin = Column(Date, nullable=True)
    valor_obra = Column(Numeric, nullable=False)
    orden_recomendado = Column(Numeric, nullable=True)

class EstructuraFisica(Base):
    __tablename__ = 'estructura_fisica'
    id_museo = Column(Numeric, primary_key=True)
    id_estructura_fisica = Column(Numeric, primary_key=True)
    nombre = Column(String(50), nullable=False)
    tipo_estructura = Column(String(15))
    descripcion = Column(String(150))
    direccion = Column(String(250))
    id_jerarquia_museo = Column(Numeric)
    id_jerarquia_estructura = Column(Numeric)

class SalaExposicion(Base):
    __tablename__ = 'sala_exposicion'
    id_museo = Column(Numeric, primary_key=True)
    id_estructura_fisica = Column(Numeric, primary_key=True)
    id_sala = Column(Numeric, primary_key=True)
    nombre_sala = Column(String(50))
    descripcion = Column(String(250))

class ColeccionPermanente(Base):
    __tablename__ = 'coleccion_permanente'
    id_museo = Column(Numeric, primary_key=True)
    id_estructura_org = Column(Numeric, primary_key=True)
    id_coleccion = Column(Numeric, primary_key=True)
    nombre_coleccion = Column(String(80), nullable=False)
    descripcion_caracteristica = Column(String(300), nullable=False)
    palabra_clave = Column(String(50), nullable=False)
    orden_recorrido = Column(Numeric, nullable=False) 