import { 
    Controller, 
    Get, 
    Post, 
    Put,
    Body, 
    Param, 
    Delete, 
    HttpException, 
    HttpStatus, 
    Logger, 
    ParseIntPipe, 
    ValidationPipe, 
    UsePipes
} from '@nestjs/common';
import { EstructuraOrganizacionalService } from '../services/estructura-organizacional.service';
import { CreateEstructuraOrganizacionalDto, UpdateEstructuraOrganizacionalDto } from '../dto/create-estructura-organizacional.dto';

@Controller('api/estructura-organizacional')
export class EstructuraOrganizacionalController {
    private readonly logger = new Logger(EstructuraOrganizacionalController.name);

    constructor(private readonly estructuraService: EstructuraOrganizacionalService) {
        this.logger.log('EstructuraOrganizacionalController inicializado');
    }

    @Post()
    @UsePipes(new ValidationPipe({ transform: true }))
    async create(@Body() createEstructuraDto: CreateEstructuraOrganizacionalDto) {
        try {
            this.logger.log(`Creando estructura organizacional: ${JSON.stringify(createEstructuraDto)}`);
            const result = await this.estructuraService.create(createEstructuraDto);
            this.logger.log(`Estructura organizacional creada: ${JSON.stringify(result)}`);
            return {
                message: 'Estructura organizacional creada exitosamente',
                data: result
            };
        } catch (error) {
            this.logger.error(`Error al crear estructura organizacional: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al crear la estructura organizacional',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get()
    async findAll() {
        try {
            this.logger.log('Obteniendo todas las estructuras organizacionales');
            const estructuras = await this.estructuraService.findAll();
            this.logger.log(`Se encontraron ${estructuras.length} estructuras`);
            return {
                message: 'Estructuras organizacionales obtenidas exitosamente',
                data: estructuras
            };
        } catch (error) {
            this.logger.error(`Error al obtener estructuras organizacionales: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al obtener las estructuras organizacionales',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get('museo/:idMuseo')
    async findByMuseo(@Param('idMuseo', ParseIntPipe) idMuseo: number) {
        try {
            this.logger.log(`Iniciando búsqueda de estructuras organizacionales para el museo ${idMuseo}`);
            const estructuras = await this.estructuraService.findByMuseo(idMuseo);
            this.logger.log(`Se encontraron ${estructuras.length} estructuras para el museo ${idMuseo}`);
            return {
                message: 'Estructuras organizacionales del museo obtenidas exitosamente',
                data: estructuras
            };
        } catch (error) {
            this.logger.error(`Error al obtener estructuras organizacionales del museo ${idMuseo}: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al obtener las estructuras organizacionales del museo',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get(':idMuseo/:idEstructuraOrg')
    async findOne(
        @Param('idMuseo', ParseIntPipe) idMuseo: number,
        @Param('idEstructuraOrg', ParseIntPipe) idEstructuraOrg: number
    ) {
        try {
            this.logger.log(`Buscando estructura organizacional con ID: ${idEstructuraOrg} del museo: ${idMuseo}`);
            const estructura = await this.estructuraService.findOne(idMuseo, idEstructuraOrg);
            this.logger.log(`Estructura encontrada: ${JSON.stringify(estructura)}`);
            return {
                message: 'Estructura organizacional obtenida exitosamente',
                data: estructura
            };
        } catch (error) {
            this.logger.error(`Error al obtener estructura organizacional: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al obtener la estructura organizacional',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Put(':idMuseo/:idEstructuraOrg')
    @UsePipes(new ValidationPipe({ transform: true }))
    async update(
        @Param('idMuseo', ParseIntPipe) idMuseo: number,
        @Param('idEstructuraOrg', ParseIntPipe) idEstructuraOrg: number,
        @Body() updateEstructuraDto: UpdateEstructuraOrganizacionalDto
    ) {
        try {
            this.logger.log(`Actualizando estructura organizacional ${idEstructuraOrg} del museo ${idMuseo}`);
            const estructura = await this.estructuraService.update(idMuseo, idEstructuraOrg, updateEstructuraDto);
            this.logger.log(`Estructura actualizada: ${JSON.stringify(estructura)}`);
            return {
                message: 'Estructura organizacional actualizada exitosamente',
                data: estructura
            };
        } catch (error) {
            this.logger.error(`Error al actualizar estructura organizacional: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al actualizar la estructura organizacional',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Delete(':idMuseo/:idEstructuraOrg')
    async remove(
        @Param('idMuseo', ParseIntPipe) idMuseo: number,
        @Param('idEstructuraOrg', ParseIntPipe) idEstructuraOrg: number
    ) {
        try {
            this.logger.log(`Eliminando estructura organizacional con ID: ${idEstructuraOrg} del museo: ${idMuseo}`);
            await this.estructuraService.remove(idMuseo, idEstructuraOrg);
            this.logger.log('Estructura organizacional eliminada exitosamente');
            return { 
                message: 'Estructura organizacional eliminada exitosamente',
                data: null
            };
        } catch (error) {
            this.logger.error(`Error al eliminar estructura organizacional: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al eliminar la estructura organizacional',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }
} 