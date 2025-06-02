import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Idioma } from './entities/idioma.entity';
import { IdiomaController } from './controllers/idioma.controller';
import { IdiomaService } from './services/idioma.service';

@Module({
    imports: [TypeOrmModule.forFeature([Idioma])],
    controllers: [IdiomaController],
    providers: [IdiomaService]
})
export class IdiomaModule {} 