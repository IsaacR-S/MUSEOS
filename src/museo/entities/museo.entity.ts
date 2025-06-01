import { Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToOne, JoinColumn } from 'typeorm';
import { Lugar } from './lugar.entity';
import { ResumenHist } from './resumen-hist.entity';

@Entity('MUSEO')
export class Museo {
  @PrimaryGeneratedColumn({ name: 'id_museo' })
  idMuseo: number;

  @Column({ name: 'nombre', length: 50 })
  nombre: string;

  @Column({ name: 'mision', length: 350, nullable: true })
  mision: string;

  @Column({ name: 'fecha_fundacion', type: 'date' })
  fechaFundacion: Date;

  @Column({ name: 'id_lugar' })
  idLugar: number;

  @ManyToOne(() => Lugar)
  @JoinColumn({ name: 'id_lugar' })
  lugar: Lugar;

  @OneToMany(() => ResumenHist, resumenHist => resumenHist.museo)
  resumenesHistoricos: ResumenHist[];
} 