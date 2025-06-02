import { Injectable, NotFoundException, ConflictException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Idioma } from '../entities/idioma.entity';
import { CreateIdiomaDto } from '../dto/create-idioma.dto';
import { UpdateIdiomaDto } from '../dto/update-idioma.dto';

@Injectable()
export class IdiomaService {
    constructor(
        @InjectRepository(Idioma)
        private idiomaRepository: Repository<Idioma>
    ) {}

    async create(createIdiomaDto: CreateIdiomaDto): Promise<Idioma> {
        // Verificar si ya existe un idioma con el mismo nombre
        const existingIdioma = await this.idiomaRepository.findOne({
            where: { nombre: createIdiomaDto.nombre }
        });

        if (existingIdioma) {
            throw new ConflictException('Ya existe un idioma con este nombre');
        }

        const idioma = this.idiomaRepository.create(createIdiomaDto);
        return await this.idiomaRepository.save(idioma);
    }

    async findAll(): Promise<Idioma[]> {
        return await this.idiomaRepository.find({
            order: {
                nombre: 'ASC'
            }
        });
    }

    async findOne(id: number): Promise<Idioma> {
        const idioma = await this.idiomaRepository.findOne({
            where: { idIdioma: id }
        });

        if (!idioma) {
            throw new NotFoundException(`No se encontró el idioma con ID ${id}`);
        }

        return idioma;
    }

    async update(id: number, updateIdiomaDto: UpdateIdiomaDto): Promise<Idioma> {
        const idioma = await this.findOne(id);

        if (updateIdiomaDto.nombre) {
            // Verificar si ya existe otro idioma con el mismo nombre
            const existingIdioma = await this.idiomaRepository.findOne({
                where: { nombre: updateIdiomaDto.nombre }
            });

            if (existingIdioma && existingIdioma.idIdioma !== id) {
                throw new ConflictException('Ya existe otro idioma con este nombre');
            }
        }

        Object.assign(idioma, updateIdiomaDto);
        return await this.idiomaRepository.save(idioma);
    }

    async remove(id: number): Promise<void> {
        const idioma = await this.findOne(id);
        await this.idiomaRepository.remove(idioma);
    }
} 