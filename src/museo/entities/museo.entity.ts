import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn, OneToMany } from 'typeorm';
import { Lugar } from '../../lugar/entities/lugar.entity';
import { ResumenHistorico } from './resumen-historico.entity';

@Entity('museo')
export class Museo {
    @PrimaryGeneratedColumn({ name: 'id_museo', type: 'integer' })
    idMuseo: number;

    @Column({ name: 'nombre', type: 'varchar', length: 50 })
    nombre: string;

    @Column({ name: 'mision', type: 'varchar', length: 350, nullable: true })
    mision: string | null;

    @Column({ name: 'fecha_fundacion', type: 'date' })
    fechaFundacion: Date;

    @Column({ name: 'id_lugar', type: 'integer' })
    idLugar: number;

    @ManyToOne(() => Lugar)
    @JoinColumn({ name: 'id_lugar' })
    lugar: Lugar;

    @OneToMany(() => ResumenHistorico, resumen => resumen.museo)
    resumenesHistoricos: ResumenHistorico[];
} 