import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { EmpIdi } from './emp-idi.entity';

@Entity('idioma')
export class Idioma {
  @PrimaryGeneratedColumn({ name: 'id_idioma', type: 'numeric' })
  idIdioma: number;

  @Column({ name: 'nombre', type: 'varchar', length: 50 })
  nombre: string;

  @OneToMany(() => EmpIdi, empIdi => empIdi.idioma)
  empleados: EmpIdi[];
} 