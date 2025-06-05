export interface FormacionProfesional {
  id_formacion?: number;
  nombre_titulo: string;
  ano: string;
  descripcion_especialidad: string;
}

export interface Idioma {
  id_idioma: number;
  nombre: string;
}

export interface EmpleadoProfesional {
  id_empleado_prof?: number;
  primer_nombre: string;
  segundo_nombre?: string;
  primer_apellido: string;
  segundo_apellido: string;
  fecha_nacimiento: string;
  doc_identidad: number;
  dato_contacto?: string;
  formaciones?: FormacionProfesional[];
  idiomas?: Idioma[];
}

export interface EmpleadoProfesionalFormData {
    primer_nombre: string;
    primer_apellido: string;
    segundo_apellido: string;
    fecha_nacimiento: string;
    doc_identidad: number;
    dato_contacto?: string;
    segundo_nombre?: string;
} 