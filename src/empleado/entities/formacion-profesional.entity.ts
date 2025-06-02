import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { EmpleadoProfesional } from './empleado-profesional.entity';

@Entity('formacion_profesional')
export class FormacionProfesional {
  @Column({ name: 'id_empleado_prof', type: 'numeric' })
  idEmpleadoProf: number;

  @PrimaryGeneratedColumn({ name: 'id_formacion', type: 'numeric' })
  idFormacion: number;

  @Column({ name: 'nombre_titulo', type: 'varchar', length: 100 })
  nombreTitulo: string;

  @Column({ name: 'ano', type: 'date' })
  ano: Date;

  @Column({ name: 'descripcion_especialidad', type: 'varchar', length: 200 })
  descripcionEspecialidad: string;

  @ManyToOne(() => EmpleadoProfesional, empleado => empleado.formaciones)
  @JoinColumn({ name: 'id_empleado_prof' })
  empleadoProfesional: EmpleadoProfesional;
} 