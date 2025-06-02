import { Controller, Get, Post, Body, Param, Delete, Query, ParseIntPipe } from '@nestjs/common';
import { LugarService } from '../services/lugar.service';
import { CreateLugarDto } from '../dto/create-lugar.dto';
import { Lugar } from '../entities/lugar.entity';

@Controller('lugares')
export class LugarController {
    constructor(private readonly lugarService: LugarService) {}

    @Post()
    create(@Body() createLugarDto: CreateLugarDto) {
        return this.lugarService.create(createLugarDto);
    }

    @Get()
    async findAll(@Query('tipo') tipo?: 'ciudad' | 'pais'): Promise<Lugar[]> {
        if (tipo) {
            return await this.lugarService.findByTipo(tipo);
        }
        return await this.lugarService.findAll();
    }

    @Get('paises')
    findPaises() {
        return this.lugarService.findPaises();
    }

    @Get('ciudades/pais/:id')
    findCiudadesByPais(@Param('id') id: string) {
        return this.lugarService.findCiudadesByPais(+id);
    }

    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.lugarService.remove(+id);
    }

    @Get(':id')
    async findOne(@Param('id', ParseIntPipe) id: number): Promise<Lugar> {
        return await this.lugarService.findOne(id);
    }
} 