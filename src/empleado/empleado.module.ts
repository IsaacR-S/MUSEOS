import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EmpleadoController } from './controllers/empleado.controller';
import { EmpleadoService } from './services/empleado.service';
import { EmpleadoProfesional } from './entities/empleado.entity';
import { FormacionProfesional } from './entities/formacion.entity';
import { AsignacionLaboral } from './entities/asignacion.entity';
import { EmpleadoIdioma } from './entities/empleado-idioma.entity';
import { IdiomaModule } from '../idioma/idioma.module';
import { EstructuraOrganizacionalModule } from '../estructura-organizacional/estructura-organizacional.module';
import { MuseoModule } from '../museo/museo.module';

@Module({
    imports: [
        TypeOrmModule.forFeature([
            EmpleadoProfesional,
            FormacionProfesional,
            AsignacionLaboral,
            EmpleadoIdioma
        ]),
        IdiomaModule,
        EstructuraOrganizacionalModule,
        MuseoModule
    ],
    controllers: [EmpleadoController],
    providers: [EmpleadoService],
    exports: [EmpleadoService]
})
export class EmpleadoModule {} 