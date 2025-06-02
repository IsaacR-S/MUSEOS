import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { ArtObra } from './art-obra.entity';

@Entity('artista')
export class Artista {
  @PrimaryGeneratedColumn({ name: 'id_artista' })
  idArtista: number;

  @Column({ name: 'nombre_artista', length: 100 })
  nombreArtista: string;

  @Column({ name: 'fecha_nacimiento', type: 'date', nullable: true })
  fechaNacimiento: Date;

  @Column({ name: 'fecha_fallecimiento', type: 'date', nullable: true })
  fechaFallecimiento: Date;

  @Column({ name: 'nacionalidad', length: 50 })
  nacionalidad: string;

  @Column({ name: 'biografia', type: 'text', nullable: true })
  biografia: string;

  @OneToMany(() => ArtObra, artObra => artObra.artista, {
    cascade: true
  })
  obras: ArtObra[];
} 