import { Entity, Column, PrimaryColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Museo } from './museo.entity';

@Entity('resumen_hist')
export class ResumenHistorico {
    @PrimaryColumn({ name: 'id_museo', type: 'integer' })
    idMuseo: number;

    @PrimaryColumn({ name: 'ano', type: 'date' })
    ano: Date;

    @Column({ name: 'hechos_hist', type: 'varchar', length: 350 })
    hechosHist: string;

    @ManyToOne(() => Museo, museo => museo.resumenesHistoricos)
    @JoinColumn({ name: 'id_museo' })
    museo: Museo;
} 