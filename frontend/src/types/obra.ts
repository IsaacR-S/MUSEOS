export interface Obra {
    id_obra: number;
    nombre_obra: string;
    fecha_periodo: string;
    tipo_obra: string;
    dimensiones: string;
    estilo_descripcion: string;
    descripcion_materiales_tecnicas: string;
}

export interface ObraFormData {
    nombre_obra: string;
    fecha_periodo: string;
    tipo_obra: string;
    dimensiones: string;
    estilo_descripcion: string;
    descripcion_materiales_tecnicas: string;
} 