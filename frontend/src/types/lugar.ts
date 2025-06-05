export interface Lugar {
  id_lugar: number;
  nombre_lugar: string;
  tipo: "pais" | "ciudad";
  id_jerarquia?: number | null;
  jerarquia_nombre?: string;
} 