import { Entity, PrimaryColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Artista } from './artista.entity';
import { Obra } from './obra.entity';

@Entity('ART_OBRA')
export class ArtObra {
  @PrimaryColumn({ name: 'id_artista' })
  idArtista: number;

  @PrimaryColumn({ name: 'id_obra' })
  idObra: number;

  @ManyToOne(() => Artista)
  @JoinColumn({ name: 'id_artista' })
  artista: Artista;

  @ManyToOne(() => Obra)
  @JoinColumn({ name: 'id_obra' })
  obra: Obra;
} 