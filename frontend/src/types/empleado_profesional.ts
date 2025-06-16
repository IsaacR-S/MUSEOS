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

export interface EstructuraOrganizacional {
  id_museo: number;
  id_estructura_org: number;
  nombre: string;
  nivel: string;
  tipo: string;
  id_jerarquia_estructura?: number | null;
  id_jerarquia_museo?: number | null;
}

export interface HistoricoEmpleadoForm {
  id_museo: number;
  id_estructura_org: number;
  fecha_inicio: string;
  rol_empleado: string;
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