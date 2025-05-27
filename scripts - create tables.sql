-------------------------------------------------------------------ISAAC-----------------------------------------------------------------
CREATE SEQUENCE seq_lugar START WITH 1 INCREMENT BY 1;

CREATE TABLE LUGAR(
  id_lugar NUMERIC primary key,
  nombre_lugar varchar(50) NOT NULL,
  tipo varchar(20),
  id_jerarquia NUMERIC,
  CONSTRAINT ch_tipo CHECK(tipo IN('ciudad', 'pais')),
  CONSTRAINT fk_jerarquia FOREIGN KEY(id_jerarquia) REFERENCES LUGAR(id_lugar)
);

CREATE SEQUENCE seq_obra START WITH 1 INCREMENT BY 1;
CREATE TABLE OBRA(
    id_obra NUMERIC PRIMARY KEY,
    nombre_obra varchar(250) NOT NULL, 
    fecha_periodo date NOT NULL,
    tipo_obra varchar(9) NOT NULL,
    dimensiones varchar(16) NOT NULL,
    estilo_descripcion varchar(80) NOT NULL, 
    descripcion_materiales_tecnicas varchar(300) NOT NULL,
    CONSTRAINT ch_tipo_obra CHECK (tipo_obra IN('pintura', 'escultura'))
);

CREATE SEQUENCE seq_artista START WITH 1 INCREMENT BY 1;
CREATE TABLE ARTISTA(
    id_artista NUMERIC primary key,
    nombre_artista VARCHAR(60),
    apellido_artista VARCHAR(60),
    fecha_nacimiento DATE, 
    apodo_artista varchar(60), 
    fecha_muerte date,
    descripcion_estilo_tecnicas varchar(300) NOT NULL
);

CREATE TABLE ART_OBRA(
    id_artista NUMERIC NOT NULL,
    id_obra NUMERIC NOT NULL,
    CONSTRAINT fk_artista FOREIGN KEY(id_artista) REFERENCES ARTISTA(id_artista),
    CONSTRAINT fk_obra FOREIGN KEY(id_obra) REFERENCES OBRA(id_obra),
    PRIMARY KEY(id_artista, id_obra)
);

CREATE SEQUENCE seq_museo START WITH 1 INCREMENT BY 1;
CREATE TABLE MUSEO(
  id_museo NUMERIC primary key,
  nombre varchar(50) NOT NULL,
  mision varchar(350),
  id_lugar NUMERIC NOT NULL, 
  fecha_fundacion DATE NOT NULL, 
  CONSTRAINT fk_lugar FOREIGN KEY(id_lugar) REFERENCES LUGAR(id_lugar)
);

CREATE TABLE RESUMEN_HIST(
    ano DATE NOT NULL,
    hechos_hist VARCHAR(350) NOT NULL,
    id_museo NUMERIC NOT NULL,
    CONSTRAINT fk_museo FOREIGN KEY(id_museo) REFERENCES MUSEO(id_museo),
    PRIMARY KEY (id_museo, ano)
);

CREATE TABLE TIPO_TICKET_HISTORICO(
    id_museo NUMERIC NOT NULL,
    fecha_inicio DATE NOT NULL,
    precio NUMERIC NOT NULL, 
    tipo_ticket VARCHAR(15) NOT NULL,
    fecha_fin DATE,
    CONSTRAINT fk_museo FOREIGN KEY(id_museo) REFERENCES MUSEO(id_museo),
    CONSTRAINT ch_tipo_ticket CHECK (tipo_ticket IN('nino', 'adulto', 'tercera edad')),
    PRIMARY KEY(fecha_inicio, id_museo)
);

CREATE SEQUENCE seq_evento START WITH 1 INCREMENT BY 1;
CREATE TABLE EVENTO(
    id_museo NUMERIC NOT NULL,
    id_evento NUMERIC NOT NULL,
    fecha_inicio_evento date,
    fecha_fin_evento date NOT NULL, 
    nombre_evento varchar(150) NOT NULL,
    institucion_educativa VARCHAR(150) NOT NULL, 
    cantidad_asistentes NUMERIC,
    lugar_exposicion VARCHAR(100),
    costo_persona NUMERIC,  
    CONSTRAINT fk_museo FOREIGN KEY(id_museo) REFERENCES MUSEO(id_museo),
    PRIMARY KEY(id_evento, id_museo)
);

CREATE SEQUENCE seq_ticket START WITH 1 INCREMENT BY 1;
CREATE TABLE TICKET(
    id_ticket NUMERIC NOT NULL,
    precio NUMERIC NOT NULL,
    tipo_ticket varchar(10) NOT NULL,
    fecha_hora_ticket date NOT NULL,
    id_museo NUMERIC,
    CONSTRAINT ch_tipo_ticket CHECK (tipo_ticket IN('nino', 'adulto', 'tercera edad')),
    CONSTRAINT fk_museo FOREIGN KEY(id_museo) REFERENCES MUSEO(id_museo),
    PRIMARY KEY(id_museo, id_ticket)
);


CREATE TABLE HORARIO(
  id_museo NUMERIC NOT NULL,
  dia NUMERIC NOT NULL,
  hora_inicio date NOT NULL, 
  hora_fin date NOT NULL,
  CONSTRAINT id_museo FOREIGN KEY(id_museo) REFERENCES MUSEO(id_museo),
  PRIMARY KEY (id_museo, dia),
  CONSTRAINT rang_dia  CHECK(dia between 1 and 7)
);

CREATE SEQUENCE seq_empleado_prof START WITH 1 INCREMENT BY 1;
CREATE TABLE EMPLEADO_PROFESIONAL(
    id_empleado_prof NUMERIC primary key,
    primer_nombre VARCHAR(20) NOT NULL,
    primer_apellido VARCHAR(20) NOT NULL, 
    segundo_apellido varchar(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    doc_identidad NUMERIC NOT NULL,
    dato_contacto varchar(100),
    segundo_nombre varchar(20)
);

CREATE SEQUENCE seq_formacion START WITH 1 INCREMENT BY 1;
CREATE TABLE FORMACION_PROFESIONA(
    id_formacion NUMERIC NOT NULL,
    id_empleado_prof NUMERIC NOT NULL,
    nombre_titulo VARCHAR(100) NOT NULL,
    ano DATE NOT NULL, 
    descripcion_especialidad VARCHAR(200) NOT NULL, 
    CONSTRAINT fk_empleado_prof FOREIGN KEY(id_empleado_prof) REFERENCES EMPLEADO_PROFESIONAL(id_empleado_prof),
    PRIMARY KEY(id_formacion, id_empleado_prof)
);

CREATE SEQUENCE seq_idioma START WITH 1 INCREMENT BY 1;
CREATE TABLE IDIOMA(
id_idioma NUMERIC PRIMARY KEY,
nombre varchar(50) NOT NULL
);
------------------------------------------------------------------JAC-----------------------------------------------------------------
CREATE TABLE EMP_IDI(
    id_idioma NUMERIC NOT NULL,
    id_empleado_prof NUMERIC NOT NULL,
    CONSTRAINT fk_idioma FOREIGN KEY(id_idioma) REFERENCES IDIOMA(id_idioma),
    CONSTRAINT fk_empleado_prof FOREIGN KEY(id_empleado_prof) REFERENCES EMPLEADO_PROFESIONAL(id_empleado_prof),
    PRIMARY KEY(id_idioma, id_empleado_prof)
);

CREATE SEQUENCE seq_estructura_org START WITH 1 INCREMENT BY 1;
CREATE TABLE ESTRUCTURA_ORGANIZACIONAL(
    id_estructura_org NUMERIC NOT NULL, 
    id_museo NUMERIC NOT NULL,
    id_jerarquia_estructura NUMERIC,
    id_jerarquia_museo NUMERIC,
    nombre VARCHAR(100) NOT NULL,
    nivel VARCHAR(50) NOT NULL, 
    tipo VARCHAR(20) NOT NULL,
    CONSTRAINT ch_tipo CHECK(tipo IN('direccion', 'departamento', 'seccion', 'subdepartamento', 'subseccion')),
    CONSTRAINT fk_jerarquia FOREIGN KEY(id_jerarquia_estructura, id_jerarquia_museo) REFERENCES ESTRUCTURA_ORGANIZACIONAL(id_estructura_org, id_museo),
    CONSTRAINT fk_museo FOREIGN KEY(id_museo) REFERENCES MUSEO(id_museo),
    PRIMARY KEY(id_estructura_org, id_museo)
); 

CREATE SEQUENCE seq_coleccion START WITH 1 INCREMENT BY 1;
CREATE TABLE COLECCION_PERMANENTE(
    id_coleccion NUMERIC NOT NULL,
    id_estructura_org NUMERIC NOT NULL,
    id_museo NUMERIC NOT NULL,
    nombre_coleccion varchar(80) NOT NULL,
    descripcion_caracteristica varchar(300) NOT NULL,
    palabra_clave varchar(50) NOT NULL,
    orden_recorrido NUMERIC NOT NULL, 
    CONSTRAINT fk_estructura_org FOREIGN KEY(id_estructura_org, id_museo) REFERENCES ESTRUCTURA_ORGANIZACIONAL(id_estructura_org, id_museo),
    PRIMARY KEY(id_coleccion, id_estructura_org, id_museo)
);

CREATE SEQUENCE seq_estructura_fisica START WITH 1 INCREMENT BY 1;

CREATE TABLE ESTRUCTURA_FISICA(
    id_estructura_fisica NUMERIC NOT NULL,
    id_museo NUMERIC NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    tipo_estructura VARCHAR(15),
    descripcion VARCHAR(150),
    direccion VARCHAR(250),
    CONSTRAINT fk_museo FOREIGN KEY(id_museo) REFERENCES MUSEO(id_museo),
    CONSTRAINT ch_tipo_estructura CHECK(tipo_estructura IN('edificio', 'piso', 'area seccion')),
    PRIMARY KEY(id_museo, id_estructura_fisica) 
);

CREATE SEQUENCE seq_sala START WITH 1 INCREMENT BY 1;
CREATE TABLE SALA_EXPOSICION(
    id_sala NUMERIC NOT NULL, 
    id_estructura_fisica NUMERIC NOT NULL,
    id_museo NUMERIC NOT NULL,
    nombre_sala VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    CONSTRAINT fk_estructura_fisica FOREIGN KEY(id_museo, id_estructura_fisica) REFERENCES ESTRUCTURA_FISICA(id_museo, id_estructura_fisica),
    PRIMARY KEY(id_museo, id_estructura_fisica,  id_sala)
);

CREATE TABLE COL_SAL(
    id_sala NUMERIC NOT NULL,
    id_museo_sala NUMERIC NOT NULL,
    id_estructura_fisica NUMERIC NOT NULL, 
    id_coleccion NUMERIC NOT NULL, 
    id_estructura_org NUMERIC NOT NULL,
    id_museo_coleccion NUMERIC NOT NULL, 
    orden_recorrido NUMERIC NOT NULL,
    CONSTRAINT fk_sala FOREIGN KEY(id_museo_sala, id_estructura_fisica, id_sala) REFERENCES SALA_EXPOSICION(id_museo, id_estructura_fisica, id_sala),
    CONSTRAINT fk_coleccion FOREIGN KEY(id_coleccion, id_estructura_org, id_museo_coleccion) REFERENCES COLECCION_PERMANENTE(id_coleccion, id_estructura_org, id_museo),
    PRIMARY KEY(id_sala, id_museo_sala, id_estructura_fisica, id_coleccion, id_estructura_org, id_museo_coleccion)
);


CREATE TABLE HIST_CIERRE(
    fecha_ini DATE NOT NULL,
    fecha_fin DATE,
    id_sala NUMERIC NOT NULL,
    id_estructura_fisica NUMERIC NOT NULL,
    id_museo NUMERIC NOT NULL,
    CONSTRAINT fk_sala_exposicion FOREIGN KEY(id_museo, id_estructura_fisica, id_sala) REFERENCES SALA_EXPOSICION(id_museo, id_estructura_fisica, id_sala),
    PRIMARY KEY(id_museo, id_estructura_fisica, id_sala)
);

CREATE SEQUENCE seq_empleado_mv START WITH 1 INCREMENT BY 1;
CREATE TABLE EMPLEADO_MANTENIMIENTO_VIGILANCIA(
    id_empleado_mantenimiento_vigilancia NUMERIC primary key,
    primer_nombre VARCHAR(20) NOT NULL,
    primer_apellido VARCHAR(20) NOT NULL, 
    doc_identidad NUMERIC NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    CONSTRAINT ch_tipo CHECK(tipo IN('vigilancia', 'mantenimiento'))
);

CREATE TABLE ASIGNACION_MENSUAL(
    mes_ano DATE NOT NULL,
    turno VARCHAR(15),
    id_empleado_mantenimiento_vigilancia NUMERIC NOT NULL,
    id_museo NUMERIC NOT NULL,
    id_estructura_fisica NUMERIC NOT NULL, 
    CONSTRAINT ch_turno CHECK(turno IN('matutino', 'vesperino', 'nocturno')),
    CONSTRAINT fk_estructura_fisica FOREIGN KEY(id_museo, id_estructura_fisica) REFERENCES ESTRUCTURA_FISICA(id_museo, id_estructura_fisica),
    CONSTRAINT fk_empleado_mv FOREIGN KEY(id_empleado_mantenimiento_vigilancia) REFERENCES EMPLEADO_MANTENIMIENTO_VIGILANCIA(id_empleado_mantenimiento_vigilancia),
    PRIMARY KEY(id_museo, id_estructura_fisica, mes_ano)
);

CREATE TABLE HISTORICO_EMPLEADO(
    fecha_inicio DATE NOT NULL,
    id_empleado NUMERIC NOT NULL,
    id_museo NUMERIC NOT NULL, 
    id_estructura_org NUMERIC NOT NULL,
    rol_empleado varchar(70) NOT NULL,
    fecha_fin date, 
    CONSTRAINT fk_estructura_org FOREIGN KEY(id_estructura_org, id_museo) REFERENCES ESTRUCTURA_ORGANIZACIONAL(id_estructura_org, id_museo),
    CONSTRAINT fk_empleado FOREIGN KEY(id_empleado) REFERENCES EMPLEADO_PROFESIONAL(id_empleado_prof),
    CONSTRAINT ch_rol CHECK(rol_empleado IN('curador', 'restaurador', 'administrativo', 'director')),
    PRIMARY KEY(fecha_inicio, id_empleado, id_estructura_org, id_museo)
);


CREATE SEQUENCE seq_mantenimiento_obra START WITH 1 INCREMENT BY 1;
CREATE TABLE HISTORICO_OBRA_MOVIMIENTO(
    id_historico_obra_movimiento NUMERIC NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date,
    tipo_obtencion varchar NOT NULL, 
    valor_obra NUMERIC NOT NULL,
    destacada VARCHAR(2) NOT NULL,
    orden_recomendado NUMERIC NOT NULL,
    id_museo_sala NUMERIC NOT NULL, 
    id_estructura_fisica NUMERIC NOT NULL, 
    id_sala NUMERIC NOT NULL,
    CONSTRAINT fk_sala FOREIGN KEY(id_museo_sala, id_estructura_fisica, id_sala) REFERENCES SALA_EXPOSICION(id_museo, id_estructura_fisica, id_sala),
    fecha_inicio_empleado DATE NOT NULL, 
    id_empleado NUMERIC NOT NULL, 
    id_estructura_org NUMERIC NOT NULL,
    id_museo_empleado NUMERIC NOT NULL,
    CONSTRAINT fk_historico_empleado FOREIGN KEY(fecha_inicio, id_empleado, id_estructura_org, id_museo_empleado) REFERENCES HISTORICO_EMPLEADO(fecha_inicio, id_empleado, id_estructura_org, id_museo),
    id_coleccion NUMERIC NOT NULL, 
    id_estructura_org_coleccion NUMERIC NOT NULL,
    id_museo_coleccion NUMERIC NOT NULL,
    CONSTRAINT fk_coleccion FOREIGN KEY(id_coleccion, id_estructura_org_coleccion, id_museo_coleccion) REFERENCES COLECCION_PERMANENTE(id_coleccion, id_estructura_org, id_museo),
    id_obra NUMERIC NOT NULL,
    CONSTRAINT fk_obra FOREIGN KEY(id_obra) REFERENCES OBRA(id_obra),
    CONSTRAINT ch_tipo_obtencion CHECK(tipo_obtencion IN('comprado', 'donado', 'comprado a otro museo', 'donado de otro museo')),
    CONSTRAINT ch_destacada CHECK(destacada IN('si', 'no')),
    primary key(id_obra, id_historico_obra_movimiento)
);

CREATE TABLE MANTENIMIENTO_OBRA(
    id_mantenimiento_obra NUMERIC NOT NULL,
    id_obra NUMERIC NOT NULL,
    id_historico_obra_movimiento NUMERIC NOT NULL, 
    actividad VARCHAR(250) NOT NULL,
    frecuencia NUMERIC NOT NULL, 
    tipo_resposable VARCHAR(15), 
    CONSTRAINT ch_tipo_responsable CHECK(tipo_resposable IN('curador', 'restaurador', 'otro')),
    CONSTRAINT fk_historico_obra_movimiento FOREIGN KEY(id_obra, id_historico_obra_movimiento) REFERENCES HISTORICO_OBRA_MOVIMIENTO(id_obra, id_historico_obra_movimiento),
    PRIMARY KEY(id_obra, id_historico_obra_movimiento, id_mantenimiento_obra)
);

CREATE SEQUENCE seq_historico_mant_re START WITH 1 INCREMENT BY 1;
CREATE TABLE HISTORICO_MANTENIMIENTO_REALIZADO(
    id_historico_mant_re NUMERIC NOT NULL, 
    fecha_inicio date NOT NULL, 
    fecha_fin date, 
    observaciones VARCHAR(250) NOT NULL,
    id_obra NUMERIC NOT NULL,
    id_historico_obra_movimiento NUMERIC NOT NULL,
    id_mantenimiento_obra NUMERIC NOT NULL,
    fecha_inicio_empleado DATE NOT NULL, 
    id_empleado NUMERIC NOT NULL, 
    id_estructura_org NUMERIC NOT NULL,
    id_museo_empleado NUMERIC NOT NULL,
    CONSTRAINT fk_historico_empleado FOREIGN KEY(fecha_inicio, id_empleado, id_estructura_org, id_museo_empleado) REFERENCES HISTORICO_EMPLEADO(fecha_inicio, id_empleado, id_estructura_org, id_museo),
    CONSTRAINT fk_mantenimiento_obra FOREIGN KEY(id_obra, id_historico_obra_movimiento, id_mantenimiento_obra) REFERENCES MANTENIMIENTO_OBRA(id_obra, id_historico_obra_movimiento, id_mantenimiento_obra),
    PRIMARY KEY(id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, id_historico_mant_re)
);

