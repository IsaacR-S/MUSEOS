import { Controller, Get, Post, Body, Param, Delete, HttpException, HttpStatus, Logger, ParseIntPipe } from '@nestjs/common';
import { MuseoService } from '../services/museo.service';
import { CreateMuseoDto } from '../dto/create-museo.dto';
import { Museo } from '../entities/museo.entity';

@Controller('museos')
export class MuseoController {
    private readonly logger = new Logger(MuseoController.name);

    constructor(private readonly museoService: MuseoService) {}

    @Post()
    async create(@Body() createMuseoDto: CreateMuseoDto) {
        try {
            this.logger.log(`Intentando crear museo: ${JSON.stringify(createMuseoDto)}`);
            const result = await this.museoService.create(createMuseoDto);
            this.logger.log(`Museo creado exitosamente: ${JSON.stringify(result)}`);
            return result;
        } catch (error) {
            this.logger.error(`Error al crear museo: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al crear el museo',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get()
    async findAll(): Promise<Museo[]> {
        try {
            this.logger.log('Obteniendo todos los museos');
            const museos = await this.museoService.findAll();
            this.logger.log(`Se encontraron ${museos.length} museos`);
            return museos;
        } catch (error) {
            this.logger.error(`Error al obtener museos: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al obtener los museos',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get(':id')
    async findOne(@Param('id', ParseIntPipe) id: number): Promise<Museo> {
        try {
            this.logger.log(`Buscando museo con ID: ${id}`);
            const museo = await this.museoService.findOne(id);
            this.logger.log(`Museo encontrado: ${JSON.stringify(museo)}`);
            return museo;
        } catch (error) {
            this.logger.error(`Error al obtener museo: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al obtener el museo',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Delete(':id')
    async remove(@Param('id') id: string) {
        try {
            this.logger.log(`Intentando eliminar museo con ID: ${id}`);
            await this.museoService.remove(+id);
            this.logger.log(`Museo eliminado exitosamente`);
            return { message: 'Museo eliminado exitosamente' };
        } catch (error) {
            this.logger.error(`Error al eliminar museo: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al eliminar el museo',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }
} 