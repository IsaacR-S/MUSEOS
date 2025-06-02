import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Museo } from '../entities/museo.entity';
import { CreateMuseoDto } from '../dto/create-museo.dto';

@Injectable()
export class MuseoService {
    constructor(
        @InjectRepository(Museo)
        private museoRepository: Repository<Museo>
    ) {}

    async create(createMuseoDto: CreateMuseoDto): Promise<Museo> {
        const museo = this.museoRepository.create(createMuseoDto);
        return await this.museoRepository.save(museo);
    }

    async findAll(): Promise<Museo[]> {
        return await this.museoRepository.find({
            relations: ['lugar']
        });
    }

    async findOne(id: number): Promise<Museo> {
        const museo = await this.museoRepository.findOne({
            where: { idMuseo: id },
            relations: ['lugar']
        });

        if (!museo) {
            throw new NotFoundException(`Museo con ID ${id} no encontrado`);
        }

        return museo;
    }

    async remove(id: number): Promise<void> {
        const result = await this.museoRepository.delete(id);
        if (result.affected === 0) {
            throw new NotFoundException(`Museo con ID ${id} no encontrado`);
        }
    }
} 