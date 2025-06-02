import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EstructuraOrganizacional } from './entities/estructura-organizacional.entity';
import { EstructuraOrganizacionalController } from './controllers/estructura-organizacional.controller';
import { EstructuraOrganizacionalService } from './services/estructura-organizacional.service';

@Module({
    imports: [TypeOrmModule.forFeature([EstructuraOrganizacional])],
    controllers: [EstructuraOrganizacionalController],
    providers: [EstructuraOrganizacionalService],
    exports: [EstructuraOrganizacionalService]
})
export class EstructuraOrganizacionalModule {} 