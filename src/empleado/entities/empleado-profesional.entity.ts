import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { FormacionProfesional } from './formacion-profesional.entity';
import { EmpIdi } from './emp-idi.entity';

@Entity('EMPLEADO_PROFESIONAL')
export class EmpleadoProfesional {
  @PrimaryGeneratedColumn({ name: 'id_empleado_prof' })
  idEmpleadoProf: number;

  @Column({ name: 'primer_nombre', length: 20 })
  primerNombre: string;

  @Column({ name: 'segundo_nombre', length: 20, nullable: true })
  segundoNombre: string;

  @Column({ name: 'primer_apellido', length: 20 })
  primerApellido: string;

  @Column({ name: 'segundo_apellido', length: 20 })
  segundoApellido: string;

  @Column({ name: 'fecha_nacimiento', type: 'date' })
  fechaNacimiento: Date;

  @Column({ name: 'doc_identidad' })
  docIdentidad: number;

  @Column({ name: 'dato_contacto', length: 100, nullable: true })
  datoContacto: string;

  @OneToMany(() => FormacionProfesional, formacion => formacion.empleado)
  formaciones: FormacionProfesional[];

  @OneToMany(() => EmpIdi, empIdi => empIdi.empleado)
  idiomas: EmpIdi[];
} 