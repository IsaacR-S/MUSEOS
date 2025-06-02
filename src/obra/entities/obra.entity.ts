import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { ArtObra } from './art-obra.entity';

@Entity('obra')
export class Obra {
    @PrimaryGeneratedColumn({ name: 'id_obra' })
    idObra: number;

    @Column({ name: 'nombre_obra', length: 100 })
    nombreObra: string;

    @Column({ name: 'fecha_periodo', type: 'date' })
    fechaPeriodo: Date;

    @Column({ name: 'tipo_obra', length: 50 })
    tipoObra: string;

    @Column({ length: 50 })
    dimensiones: string;

    @Column({ name: 'estilo_descripcion', length: 100 })
    estiloDescripcion: string;

    @Column({ name: 'descripcion_materiales_tecnicas', type: 'text' })
    descripcionMaterialesTecnicas: string;

    @OneToMany(() => ArtObra, artObra => artObra.obra)
    artistas: ArtObra[];
} 