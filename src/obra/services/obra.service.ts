import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Obra } from '../entities/obra.entity';
import { ArtObra } from '../entities/art-obra.entity';
import { CreateObraDto } from '../dto/create-obra.dto';

@Injectable()
export class ObraService {
    constructor(
        @InjectRepository(Obra)
        private obraRepository: Repository<Obra>,
        @InjectRepository(ArtObra)
        private artObraRepository: Repository<ArtObra>
    ) {}

    async create(createObraDto: CreateObraDto): Promise<Obra> {
        const { artistasIds, ...obraData } = createObraDto;
        
        // Crear la obra
        const obra = this.obraRepository.create(obraData);
        const savedObra = await this.obraRepository.save(obra);

        // Crear las relaciones con los artistas
        if (artistasIds && artistasIds.length > 0) {
            const artObras = artistasIds.map(artistaId => 
                this.artObraRepository.create({
                    idObra: savedObra.idObra,
                    idArtista: artistaId
                })
            );
            await this.artObraRepository.save(artObras);
        }

        return this.findOne(savedObra.idObra);
    }

    async findAll(): Promise<Obra[]> {
        return this.obraRepository.find({
            relations: ['artistas', 'artistas.artista']
        });
    }

    async findOne(id: number): Promise<Obra> {
        const obra = await this.obraRepository.findOne({
            where: { idObra: id },
            relations: ['artistas', 'artistas.artista']
        });

        if (!obra) {
            throw new NotFoundException(`Obra con ID ${id} no encontrada`);
        }

        return obra;
    }

    async findByTipo(tipo: 'pintura' | 'escultura'): Promise<Obra[]> {
        return this.obraRepository.find({
            where: { tipoObra: tipo },
            relations: ['artistas', 'artistas.artista']
        });
    }

    async remove(id: number): Promise<void> {
        // Primero eliminamos las relaciones en art_obra
        await this.artObraRepository.delete({ idObra: id });
        
        // Luego eliminamos la obra
        const result = await this.obraRepository.delete(id);
        
        if (result.affected === 0) {
            throw new NotFoundException(`Obra con ID ${id} no encontrada`);
        }
    }
} 