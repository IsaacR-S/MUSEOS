import { Entity, Column, ManyToOne, JoinColumn } from 'typeorm';
import { EmpleadoProfesional } from './empleado.entity';
import { Idioma } from '../../idioma/entities/idioma.entity';

@Entity('empleado_idioma')
export class EmpleadoIdioma {
    @Column({ name: 'id_empleado_prof', type: 'integer', primary: true })
    idEmpleadoProf: number;

    @Column({ name: 'id_idioma', type: 'integer', primary: true })
    idIdioma: number;

    @ManyToOne(() => EmpleadoProfesional, empleado => empleado.idiomas)
    @JoinColumn({ name: 'id_empleado_prof' })
    empleado: EmpleadoProfesional;

    @ManyToOne(() => Idioma)
    @JoinColumn({ name: 'id_idioma' })
    idioma: Idioma;
} 