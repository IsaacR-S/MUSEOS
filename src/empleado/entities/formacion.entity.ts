import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { EmpleadoProfesional } from './empleado.entity';

@Entity('formacion_profesional')
export class FormacionProfesional {
    @PrimaryGeneratedColumn({ name: 'id_formacion', type: 'integer' })
    idFormacion: number;

    @Column({ name: 'nombre_titulo', type: 'varchar', length: 50 })
    nombreTitulo: string;

    @Column({ name: 'ano', type: 'date' })
    ano: Date;

    @Column({ name: 'descripcion_especialidad', type: 'varchar', length: 350 })
    descripcionEspecialidad: string;

    @Column({ name: 'id_empleado_prof', type: 'integer' })
    idEmpleadoProf: number;

    @ManyToOne(() => EmpleadoProfesional, empleado => empleado.formaciones)
    @JoinColumn({ name: 'id_empleado_prof' })
    empleado: EmpleadoProfesional;
} 