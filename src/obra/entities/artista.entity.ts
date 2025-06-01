import { Entity, Column, PrimaryGeneratedColumn, ManyToMany } from 'typeorm';
import { Obra } from './obra.entity';

@Entity('ARTISTA')
export class Artista {
  @PrimaryGeneratedColumn({ name: 'id_artista' })
  idArtista: number;

  @Column({ name: 'nombre_artista', length: 60, nullable: true })
  nombreArtista: string;

  @Column({ name: 'apellido_artista', length: 60, nullable: true })
  apellidoArtista: string;

  @Column({ name: 'fecha_nacimiento', type: 'date', nullable: true })
  fechaNacimiento: Date;

  @Column({ name: 'apodo_artista', length: 60, nullable: true })
  apodoArtista: string;

  @Column({ name: 'fecha_muerte', type: 'date', nullable: true })
  fechaMuerte: Date;

  @Column({ name: 'descripcion_estilo_tecnicas', length: 300 })
  descripcionEstiloTecnicas: string;

  @ManyToMany(() => Obra, obra => obra.artistas)
  obras: Obra[];
} 