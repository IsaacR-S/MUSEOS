import { Injectable, HttpException, HttpStatus, Logger, NotFoundException, InternalServerErrorException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Lugar } from '../entities/lugar.entity';
import { CreateLugarDto } from '../dto/create-lugar.dto';

@Injectable()
export class LugarService {
    private readonly logger = new Logger(LugarService.name);

    constructor(
        @InjectRepository(Lugar)
        private readonly lugarRepository: Repository<Lugar>,
    ) {}

    async create(createLugarDto: CreateLugarDto): Promise<Lugar> {
        try {
            // Si es una ciudad, verificar que el país exista
            if (createLugarDto.tipo === 'ciudad' && createLugarDto.idJerarquia) {
                const pais = await this.lugarRepository.findOne({
                    where: { 
                        idLugar: createLugarDto.idJerarquia,
                        tipo: 'pais'
                    }
                });

                if (!pais) {
                    throw new HttpException('El país especificado no existe', HttpStatus.BAD_REQUEST);
                }
            }

            const lugar = this.lugarRepository.create(createLugarDto);
            return await this.lugarRepository.save(lugar);
        } catch (error) {
            this.logger.error(`Error al crear lugar: ${error.message}`, error.stack);
            throw error;
        }
    }

    async findAll(): Promise<Lugar[]> {
        return await this.lugarRepository.find({
            relations: ['jerarquia', 'lugares']
        });
    }

    async findOne(id: number): Promise<Lugar> {
        const lugar = await this.lugarRepository.findOne({
            where: { idLugar: id },
            relations: ['jerarquia', 'lugares']
        });

        if (!lugar) {
            throw new NotFoundException(`No se encontró el lugar con ID ${id}`);
        }

        return lugar;
    }

    async findByTipo(tipo: 'ciudad' | 'pais'): Promise<Lugar[]> {
        return await this.lugarRepository.find({
            where: { tipo },
            relations: ['jerarquia', 'lugares']
        });
    }

    async findPaises(): Promise<Lugar[]> {
        try {
            return await this.lugarRepository.find({
                where: { tipo: 'pais' }
            });
        } catch (error) {
            this.logger.error(`Error al buscar países: ${error.message}`, error.stack);
            throw new HttpException(
                'Error al obtener los países',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    async findCiudadesByPais(idPais: number): Promise<Lugar[]> {
        try {
            return await this.lugarRepository.find({
                where: {
                    tipo: 'ciudad',
                    idJerarquia: idPais
                },
                relations: ['jerarquia']
            });
        } catch (error) {
            this.logger.error(`Error al buscar ciudades por país: ${error.message}`, error.stack);
            throw new HttpException(
                'Error al obtener las ciudades',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    async remove(id: number): Promise<void> {
        try {
            const lugar = await this.lugarRepository.findOne({
                where: { idLugar: id },
                relations: ['lugares']
            });

            if (!lugar) {
                throw new HttpException('Lugar no encontrado', HttpStatus.NOT_FOUND);
            }

            if (lugar.lugares && lugar.lugares.length > 0) {
                throw new HttpException(
                    'No se puede eliminar el lugar porque tiene lugares dependientes',
                    HttpStatus.BAD_REQUEST
                );
            }

            await this.lugarRepository.remove(lugar);
        } catch (error) {
            this.logger.error(`Error al eliminar lugar: ${error.message}`, error.stack);
            throw error;
        }
    }
} 