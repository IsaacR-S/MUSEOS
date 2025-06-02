import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { FormacionProfesional } from './formacion-profesional.entity';
import { EmpIdi } from './emp-idi.entity';

@Entity('empleado_profesional')
export class EmpleadoProfesional {
  @PrimaryGeneratedColumn({ name: 'id_empleado_prof', type: 'numeric' })
  idEmpleadoProf: number;

  @Column({ name: 'primer_nombre', type: 'varchar', length: 20 })
  primerNombre: string;

  @Column({ name: 'segundo_nombre', type: 'varchar', length: 20, nullable: true })
  segundoNombre: string;

  @Column({ name: 'primer_apellido', type: 'varchar', length: 20 })
  primerApellido: string;

  @Column({ name: 'segundo_apellido', type: 'varchar', length: 20 })
  segundoApellido: string;

  @Column({ name: 'fecha_nacimiento', type: 'date' })
  fechaNacimiento: Date;

  @Column({ name: 'doc_identidad', type: 'numeric' })
  docIdentidad: number;

  @Column({ name: 'dato_contacto', type: 'varchar', length: 100, nullable: true })
  datoContacto: string;

  @OneToMany(() => FormacionProfesional, formacion => formacion.empleadoProfesional)
  formaciones: FormacionProfesional[];

  @OneToMany(() => EmpIdi, empIdi => empIdi.empleadoProfesional)
  idiomas: EmpIdi[];
} 