export interface Museo {
  id_museo: number;
  nombre: string;
  mision?: string;
  fecha_fundacion: string;
  id_lugar: number;
}

export interface MuseoFormData {
  nombre: string;
  mision: string;
  fecha_fundacion: string;
  id_lugar: string;
} 