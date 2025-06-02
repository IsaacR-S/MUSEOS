import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { EmpleadoIdioma } from '../../empleado/entities/empleado-idioma.entity';

@Entity('idioma')
export class Idioma {
    @PrimaryGeneratedColumn({ name: 'id_idioma', type: 'integer' })
    idIdioma: number;

    @Column({ name: 'nombre', type: 'varchar', length: 50 })
    nombre: string;

    @OneToMany(() => EmpleadoIdioma, empleadoIdioma => empleadoIdioma.idioma)
    empleados: EmpleadoIdioma[];
} 