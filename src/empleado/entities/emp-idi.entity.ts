import { Entity, PrimaryColumn, ManyToOne, JoinColumn } from 'typeorm';
import { EmpleadoProfesional } from './empleado-profesional.entity';
import { Idioma } from './idioma.entity';

@Entity('EMP_IDI')
export class EmpIdi {
  @PrimaryColumn({ name: 'id_idioma' })
  idIdioma: number;

  @PrimaryColumn({ name: 'id_empleado_prof' })
  idEmpleadoProf: number;

  @ManyToOne(() => Idioma)
  @JoinColumn({ name: 'id_idioma' })
  idioma: Idioma;

  @ManyToOne(() => EmpleadoProfesional, empleado => empleado.idiomas)
  @JoinColumn({ name: 'id_empleado_prof' })
  empleado: EmpleadoProfesional;
} 