import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, OneToMany, JoinColumn } from 'typeorm';

@Entity('lugar')
export class Lugar {
  @PrimaryGeneratedColumn({ name: 'id_lugar', type: 'numeric' })
  idLugar: number;

  @Column({ name: 'nombre_lugar', type: 'varchar', length: 50 })
  nombreLugar: string;

  @Column({ type: 'varchar', length: 20 })
  tipo: 'ciudad' | 'pais';

  @Column({ name: 'id_jerarquia', type: 'numeric', nullable: true })
  idJerarquia: number | null;

  @ManyToOne(() => Lugar, { nullable: true })
  @JoinColumn({ name: 'id_jerarquia' })
  jerarquia: Lugar | null;

  @OneToMany(() => Lugar, lugar => lugar.jerarquia)
  lugaresHijos: Lugar[];
} 