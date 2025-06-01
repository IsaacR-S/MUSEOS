import { Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToMany, JoinTable } from 'typeorm';
import { Artista } from './artista.entity';
import { ArtObra } from './art-obra.entity';

@Entity('OBRA')
export class Obra {
  @PrimaryGeneratedColumn({ name: 'id_obra' })
  idObra: number;

  @Column({ name: 'nombre_obra', length: 250 })
  nombreObra: string;

  @Column({ name: 'fecha_periodo', type: 'date' })
  fechaPeriodo: Date;

  @Column({ name: 'tipo_obra', length: 9 })
  tipoObra: 'pintura' | 'escultura';

  @Column({ name: 'dimensiones', length: 16 })
  dimensiones: string;

  @Column({ name: 'estilo_descripcion', length: 80 })
  estiloDescripcion: string;

  @Column({ name: 'descripcion_materiales_tecnicas', length: 300 })
  descripcionMaterialesTecnicas: string;

  @ManyToMany(() => Artista)
  @JoinTable({
    name: 'ART_OBRA',
    joinColumn: { name: 'id_obra', referencedColumnName: 'idObra' },
    inverseJoinColumn: { name: 'id_artista', referencedColumnName: 'idArtista' },
  })
  artistas: Artista[];
} 