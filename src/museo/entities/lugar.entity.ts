import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, OneToMany, JoinColumn } from 'typeorm';

@Entity('LUGAR')
export class Lugar {
  @PrimaryGeneratedColumn({ name: 'id_lugar' })
  idLugar: number;

  @Column({ name: 'nombre_lugar', length: 50 })
  nombreLugar: string;

  @Column({ name: 'tipo', length: 20 })
  tipo: 'ciudad' | 'pais';

  @Column({ name: 'id_jerarquia', nullable: true })
  idJerarquia: number;

  @ManyToOne(() => Lugar)
  @JoinColumn({ name: 'id_jerarquia' })
  jerarquia: Lugar;

  @OneToMany(() => Lugar, lugar => lugar.jerarquia)
  lugaresHijos: Lugar[];
} 