import { Controller, Get, Post, Body, Param, Delete, HttpException, HttpStatus, ParseIntPipe } from '@nestjs/common';
import { ObraService } from '../services/obra.service';
import { CreateObraDto } from '../dto/create-obra.dto';
import { Obra } from '../entities/obra.entity';

@Controller('obras')
export class ObraController {
    constructor(private readonly obraService: ObraService) {}

    @Post()
    async create(@Body() createObraDto: CreateObraDto) {
        try {
            return await this.obraService.create(createObraDto);
        } catch (error) {
            throw new HttpException(
                error.message || 'Error al crear la obra',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get()
    async findAll(): Promise<Obra[]> {
        try {
            return await this.obraService.findAll();
        } catch (error) {
            throw new HttpException(
                error.message || 'Error al obtener las obras',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get(':id')
    async findOne(@Param('id', ParseIntPipe) id: number): Promise<Obra> {
        try {
            const obra = await this.obraService.findOne(id);
            if (!obra) {
                throw new HttpException('Obra no encontrada', HttpStatus.NOT_FOUND);
            }
            return obra;
        } catch (error) {
            throw new HttpException(
                error.message || 'Error al obtener la obra',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Delete(':id')
    async remove(@Param('id', ParseIntPipe) id: number) {
        try {
            await this.obraService.remove(id);
            return { message: 'Obra eliminada exitosamente' };
        } catch (error) {
            throw new HttpException(
                error.message || 'Error al eliminar la obra',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }
} 