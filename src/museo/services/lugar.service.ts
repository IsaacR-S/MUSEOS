import { Injectable, BadRequestException, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Lugar } from '../entities/lugar.entity';
import { CreateLugarDto } from '../dto/create-lugar.dto';
import { UpdateLugarDto } from '../dto/update-lugar.dto';

@Injectable()
export class LugarService {
    constructor(
        @InjectRepository(Lugar)
        private lugarRepository: Repository<Lugar>
    ) {}

    async create(createLugarDto: CreateLugarDto): Promise<Lugar> {
        try {
            // Si es una ciudad, verificar que el idJerarquia exista y sea un país
            if (createLugarDto.tipo === 'ciudad') {
                if (!createLugarDto.idJerarquia) {
                    throw new BadRequestException('Una ciudad debe tener un país asociado');
                }

                const pais = await this.lugarRepository.findOne({
                    where: { 
                        idLugar: createLugarDto.idJerarquia,
                        tipo: 'pais'
                    }
                });

                if (!pais) {
                    throw new BadRequestException('El país especificado no existe');
                }
            }

            // Si es un país, asegurarse que no tenga jerarquía
            if (createLugarDto.tipo === 'pais') {
                createLugarDto.idJerarquia = null;
            }

            const lugar = this.lugarRepository.create(createLugarDto);
            return await this.lugarRepository.save(lugar);
        } catch (error) {
            console.error('Error al crear lugar:', error);
            if (error instanceof BadRequestException) {
                throw error;
            }
            throw new BadRequestException(error.message || 'Error al crear el lugar');
        }
    }

    async findAll(): Promise<Lugar[]> {
        return this.lugarRepository.find({
            relations: ['jerarquia'],
            order: {
                nombreLugar: 'ASC'
            }
        });
    }

    async findPaises(): Promise<Lugar[]> {
        return this.lugarRepository.find({
            where: { tipo: 'pais' },
            order: {
                nombreLugar: 'ASC'
            }
        });
    }

    async findCiudadesPorPais(idPais: number): Promise<Lugar[]> {
        return this.lugarRepository.find({
            where: { 
                tipo: 'ciudad',
                idJerarquia: idPais
            },
            relations: ['jerarquia'],
            order: {
                nombreLugar: 'ASC'
            }
        });
    }

    async findOne(id: number): Promise<Lugar> {
        const lugar = await this.lugarRepository.findOne({
            where: { idLugar: id },
            relations: ['jerarquia', 'lugaresHijos']
        });

        if (!lugar) {
            throw new NotFoundException(`Lugar con ID ${id} no encontrado`);
        }

        return lugar;
    }

    async update(id: number, updateLugarDto: UpdateLugarDto): Promise<Lugar> {
        const lugar = await this.findOne(id);

        // Verificar si se está cambiando el tipo
        if (updateLugarDto.tipo && updateLugarDto.tipo !== lugar.tipo) {
            // Si se cambia a país, no debe tener jerarquía
            if (updateLugarDto.tipo === 'pais') {
                updateLugarDto.idJerarquia = null;
            }
            // Si se cambia a ciudad, debe tener un país válido
            else if (updateLugarDto.tipo === 'ciudad' && !updateLugarDto.idJerarquia) {
                throw new BadRequestException('Una ciudad debe pertenecer a un país');
            }
        }

        // Si se está actualizando la jerarquía
        if (updateLugarDto.idJerarquia) {
            const nuevoPadre = await this.findOne(updateLugarDto.idJerarquia);
            if (nuevoPadre.tipo !== 'pais') {
                throw new BadRequestException('La jerarquía superior debe ser un país');
            }
        }

        // Verificar que no tenga lugares dependientes si se está cambiando a ciudad
        if (updateLugarDto.tipo === 'ciudad') {
            const tieneHijos = await this.lugarRepository.findOne({
                where: { idJerarquia: id }
            });
            if (tieneHijos) {
                throw new BadRequestException('No se puede cambiar a ciudad porque tiene lugares dependientes');
            }
        }

        Object.assign(lugar, updateLugarDto);
        return this.lugarRepository.save(lugar);
    }

    async remove(id: number): Promise<void> {
        const lugar = await this.findOne(id);

        // Verificar si tiene lugares dependientes
        const tieneHijos = await this.lugarRepository.findOne({
            where: { idJerarquia: id }
        });

        if (tieneHijos) {
            throw new BadRequestException('No se puede eliminar porque tiene lugares dependientes');
        }

        await this.lugarRepository.remove(lugar);
    }
} 