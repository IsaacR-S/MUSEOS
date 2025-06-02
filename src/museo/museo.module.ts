import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Museo } from './entities/museo.entity';
import { ResumenHistorico } from './entities/resumen-historico.entity';
import { MuseoController } from './controllers/museo.controller';
import { MuseoService } from './services/museo.service';
import { LugarModule } from '../lugar/lugar.module';

@Module({
    imports: [
        TypeOrmModule.forFeature([Museo, ResumenHistorico]),
        LugarModule
    ],
    controllers: [MuseoController],
    providers: [MuseoService],
    exports: [MuseoService]
})
export class MuseoModule {} 