import { Entity, Column, PrimaryColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Museo } from './museo.entity';

@Entity('RESUMEN_HIST')
export class ResumenHist {
  @PrimaryColumn({ name: 'id_museo' })
  idMuseo: number;

  @PrimaryColumn({ name: 'ano', type: 'date' })
  ano: Date;

  @Column({ name: 'hechos_hist', length: 350 })
  hechosHist: string;

  @ManyToOne(() => Museo, museo => museo.resumenesHistoricos)
  @JoinColumn({ name: 'id_museo' })
  museo: Museo;
} 