import { Entity, Column, ManyToOne, JoinColumn, OneToMany, PrimaryColumn, BeforeInsert } from 'typeorm';
import { Museo } from '../../museo/entities/museo.entity';

@Entity('estructura_organizacional')
export class EstructuraOrganizacional {
    @PrimaryColumn({ name: 'id_museo', type: 'numeric' })
    idMuseo: number;

    @PrimaryColumn({ name: 'id_estructura_org', type: 'numeric' })
    idEstructuraOrg: number;

    @Column({ name: 'nombre', type: 'varchar', length: 100 })
    nombre: string;

    @Column({ 
        name: 'nivel', 
        type: 'varchar', 
        length: 50,
        enum: ['Nivel 1', 'Nivel 2', 'Nivel 3', 'Nivel 4'] 
    })
    nivel: string;

    @Column({ 
        name: 'tipo', 
        type: 'varchar', 
        length: 50,
        enum: ['direccion', 'departamento', 'seccion', 'subdepartamento', 'subseccion'] 
    })
    tipo: string;

    @Column({ name: 'id_jerarquia_estructura', type: 'numeric', nullable: true })
    idJerarquiaEstructura: number | null;

    @Column({ name: 'id_jerarquia_museo', type: 'numeric', nullable: true })
    idJerarquiaMuseo: number | null;

    @ManyToOne(() => EstructuraOrganizacional)
    @JoinColumn([
        { name: 'id_jerarquia_museo', referencedColumnName: 'idMuseo' },
        { name: 'id_jerarquia_estructura', referencedColumnName: 'idEstructuraOrg' }
    ])
    jerarquia: EstructuraOrganizacional | null;

    @OneToMany(() => EstructuraOrganizacional, estructura => estructura.jerarquia)
    subestructuras: EstructuraOrganizacional[];

    @ManyToOne(() => Museo, { eager: true })
    @JoinColumn({ name: 'id_museo' })
    museo: Museo;
} 