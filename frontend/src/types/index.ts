export interface Lugar {
  id_lugar: number;
  nombre_lugar: string;
  tipo: 'ciudad' | 'pais';
  id_jerarquia: number | null;
  jerarquia_nombre?: string;
}

export interface LugarFormData {
  nombre_lugar: string;
  tipo: 'ciudad' | 'pais';
  id_jerarquia: string;
}

export * from './artista'; 