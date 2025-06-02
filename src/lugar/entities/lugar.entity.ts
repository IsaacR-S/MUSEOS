import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, OneToMany } from 'typeorm';

@Entity('lugar')
export class Lugar {
    @PrimaryGeneratedColumn({ name: 'id_lugar', type: 'integer' })
    idLugar: number;

    @Column({ name: 'nombre_lugar', type: 'varchar', length: 50 })
    nombreLugar: string;

    @Column({ type: 'varchar', length: 20 })
    tipo: 'ciudad' | 'pais';

    @Column({ name: 'id_jerarquia', type: 'integer', nullable: true })
    idJerarquia: number | null;

    @ManyToOne(() => Lugar, lugar => lugar.lugares)
    @JoinColumn({ name: 'id_jerarquia' })
    jerarquia: Lugar | null;

    @OneToMany(() => Lugar, lugar => lugar.jerarquia)
    lugares: Lugar[];
} 