-- Crear tabla lugar
CREATE TABLE IF NOT EXISTS lugar (
    id_lugar SERIAL PRIMARY KEY,
    nombre_lugar VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('ciudad', 'pais')),
    id_jerarquia INTEGER REFERENCES lugar(id_lugar)
);

-- Crear tabla museo
CREATE TABLE IF NOT EXISTS museo (
    id_museo SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    mision VARCHAR(350),
    fecha_fundacion DATE NOT NULL,
    id_lugar INTEGER NOT NULL REFERENCES lugar(id_lugar)
);

-- Crear tabla resumen_historico
CREATE TABLE IF NOT EXISTS resumen_historico (
    id_resumen SERIAL PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    descripcion VARCHAR(500) NOT NULL,
    id_museo INTEGER NOT NULL REFERENCES museo(id_museo)
);

-- Crear índices
CREATE INDEX IF NOT EXISTS idx_lugar_tipo ON lugar(tipo);
CREATE INDEX IF NOT EXISTS idx_lugar_jerarquia ON lugar(id_jerarquia);
CREATE INDEX IF NOT EXISTS idx_museo_lugar ON museo(id_lugar);
CREATE INDEX IF NOT EXISTS idx_resumen_museo ON resumen_historico(id_museo); 