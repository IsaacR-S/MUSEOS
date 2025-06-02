import { Entity, Column, ManyToOne, JoinColumn, PrimaryColumn } from 'typeorm';
import { Obra } from './obra.entity';
import { Artista } from './artista.entity';

@Entity('art_obra')
export class ArtObra {
    @PrimaryColumn({ name: 'id_obra' })
    idObra: number;

    @PrimaryColumn({ name: 'id_artista' })
    idArtista: number;

    @ManyToOne(() => Obra, obra => obra.artistas, {
        onDelete: 'CASCADE'
    })
    @JoinColumn({ name: 'id_obra' })
    obra: Obra;

    @ManyToOne(() => Artista, artista => artista.obras, {
        onDelete: 'CASCADE'
    })
    @JoinColumn({ name: 'id_artista' })
    artista: Artista;
} 