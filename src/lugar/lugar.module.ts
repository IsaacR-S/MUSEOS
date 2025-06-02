import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Lugar } from './entities/lugar.entity';
import { LugarController } from './controllers/lugar.controller';
import { LugarService } from './services/lugar.service';

@Module({
    imports: [TypeOrmModule.forFeature([Lugar])],
    controllers: [LugarController],
    providers: [LugarService],
    exports: [LugarService]
})
export class LugarModule {} 