import { Entity, Column, PrimaryColumn, ManyToOne, JoinColumn } from 'typeorm';
import { EmpleadoProfesional } from './empleado-profesional.entity';

@Entity('FORMACION_PROFESIONAL')
export class FormacionProfesional {
  @PrimaryColumn({ name: 'id_empleado_prof' })
  idEmpleadoProf: number;

  @PrimaryColumn({ name: 'id_formacion' })
  idFormacion: number;

  @Column({ name: 'nombre_titulo', length: 100 })
  nombreTitulo: string;

  @Column({ name: 'ano', type: 'date' })
  ano: Date;

  @Column({ name: 'descripcion_especialidad', length: 200 })
  descripcionEspecialidad: string;

  @ManyToOne(() => EmpleadoProfesional, empleado => empleado.formaciones)
  @JoinColumn({ name: 'id_empleado_prof' })
  empleado: EmpleadoProfesional;
} 