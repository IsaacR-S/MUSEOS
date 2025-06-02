import { Controller, Get, Post, Put, Delete, Body, Param, Query, HttpException, HttpStatus } from '@nestjs/common';
import { LugarService } from '../services/lugar.service';
import { CreateLugarDto } from '../dto/create-lugar.dto';
import { UpdateLugarDto } from '../dto/update-lugar.dto';

@Controller('lugares')
export class LugarController {
    constructor(private readonly lugarService: LugarService) {}

    @Post()
    async create(@Body() createLugarDto: CreateLugarDto) {
        try {
            return await this.lugarService.create(createLugarDto);
        } catch (error) {
            console.error('Error al crear lugar:', error);
            if (error.code === '23505') {
                throw new HttpException('Ya existe un lugar con ese nombre', HttpStatus.CONFLICT);
            }
            throw new HttpException(
                error.message || 'Error al crear el lugar',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get()
    async findAll(@Query('tipo') tipo?: 'ciudad' | 'pais') {
        try {
            if (tipo === 'pais') {
                return await this.lugarService.findPaises();
            }
            return await this.lugarService.findAll();
        } catch (error) {
            console.error('Error al buscar lugares:', error);
            throw new HttpException(
                'Error al obtener los lugares',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get('paises')
    async findPaises() {
        try {
            return await this.lugarService.findPaises();
        } catch (error) {
            console.error('Error al buscar países:', error);
            throw new HttpException(
                'Error al obtener los países',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get('ciudades/pais/:idPais')
    async findCiudadesPorPais(@Param('idPais') idPais: string) {
        try {
            return await this.lugarService.findCiudadesPorPais(+idPais);
        } catch (error) {
            console.error('Error al buscar ciudades:', error);
            throw new HttpException(
                'Error al obtener las ciudades del país',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get(':id')
    async findOne(@Param('id') id: string) {
        try {
            return await this.lugarService.findOne(+id);
        } catch (error) {
            console.error('Error al buscar lugar:', error);
            throw new HttpException(
                'Error al obtener el lugar',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Put(':id')
    async update(@Param('id') id: string, @Body() updateLugarDto: UpdateLugarDto) {
        try {
            return await this.lugarService.update(+id, updateLugarDto);
        } catch (error) {
            console.error('Error al actualizar lugar:', error);
            throw new HttpException(
                'Error al actualizar el lugar',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Delete(':id')
    async remove(@Param('id') id: string) {
        try {
            return await this.lugarService.remove(+id);
        } catch (error) {
            console.error('Error al eliminar lugar:', error);
            throw new HttpException(
                'Error al eliminar el lugar',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }
} 