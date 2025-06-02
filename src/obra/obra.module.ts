import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ObraController } from './controllers/obra.controller';
import { ObraService } from './services/obra.service';
import { Obra } from './entities/obra.entity';
import { Artista } from './entities/artista.entity';
import { ArtObra } from './entities/art-obra.entity';

@Module({
    imports: [
        TypeOrmModule.forFeature([Obra, Artista, ArtObra])
    ],
    controllers: [ObraController],
    providers: [ObraService],
    exports: [ObraService]
})
export class ObraModule {} 