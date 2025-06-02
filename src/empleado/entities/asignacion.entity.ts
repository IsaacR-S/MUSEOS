import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { EmpleadoProfesional } from './empleado.entity';
import { EstructuraOrganizacional } from '../../estructura-organizacional/entities/estructura-organizacional.entity';
import { Museo } from '../../museo/entities/museo.entity';

@Entity('asignacion_laboral')
export class AsignacionLaboral {
    @PrimaryGeneratedColumn({ name: 'id_asignacion', type: 'integer' })
    idAsignacion: number;

    @Column({ name: 'id_empleado_prof', type: 'integer' })
    idEmpleadoProf: number;

    @Column({ name: 'id_museo', type: 'integer' })
    idMuseo: number;

    @Column({ name: 'id_estructura_org', type: 'integer' })
    idEstructuraOrg: number;

    @Column({ name: 'rol_empleado', type: 'varchar', length: 20 })
    rolEmpleado: string;

    @Column({ name: 'fecha_inicio', type: 'date' })
    fechaInicio: Date;

    @ManyToOne(() => EmpleadoProfesional, empleado => empleado.asignaciones)
    @JoinColumn({ name: 'id_empleado_prof' })
    empleado: EmpleadoProfesional;

    @ManyToOne(() => Museo)
    @JoinColumn({ name: 'id_museo' })
    museo: Museo;

    @ManyToOne(() => EstructuraOrganizacional)
    @JoinColumn({ name: 'id_estructura_org' })
    estructuraOrganizacional: EstructuraOrganizacional;
} 