import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { EmpIdi } from './emp-idi.entity';

@Entity('IDIOMA')
export class Idioma {
  @PrimaryGeneratedColumn({ name: 'id_idioma' })
  idIdioma: number;

  @Column({ name: 'nombre', length: 50 })
  nombre: string;

  @OneToMany(() => EmpIdi, empIdi => empIdi.idioma)
  empleados: EmpIdi[];
} 