import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { FormacionProfesional } from './formacion.entity';
import { AsignacionLaboral } from './asignacion.entity';
import { EmpleadoIdioma } from './empleado-idioma.entity';

@Entity('empleado_profesional')
export class EmpleadoProfesional {
    @PrimaryGeneratedColumn({ name: 'id_empleado_prof', type: 'integer' })
    idEmpleadoProf: number;

    @Column({ name: 'primer_nombre', type: 'varchar', length: 50 })
    primerNombre: string;

    @Column({ name: 'segundo_nombre', type: 'varchar', length: 50, nullable: true })
    segundoNombre: string | null;

    @Column({ name: 'primer_apellido', type: 'varchar', length: 50 })
    primerApellido: string;

    @Column({ name: 'segundo_apellido', type: 'varchar', length: 50 })
    segundoApellido: string;

    @Column({ name: 'fecha_nacimiento', type: 'date' })
    fechaNacimiento: Date;

    @Column({ name: 'doc_identidad', type: 'integer', unique: true })
    docIdentidad: number;

    @Column({ name: 'dato_contacto', type: 'varchar', length: 100, nullable: true })
    datoContacto: string | null;

    @OneToMany(() => FormacionProfesional, formacion => formacion.empleado)
    formaciones: FormacionProfesional[];

    @OneToMany(() => AsignacionLaboral, asignacion => asignacion.empleado)
    asignaciones: AsignacionLaboral[];

    @OneToMany(() => EmpleadoIdioma, empleadoIdioma => empleadoIdioma.empleado)
    idiomas: EmpleadoIdioma[];
} 