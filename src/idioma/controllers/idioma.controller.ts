import { Controller, Get, Post, Put, Delete, Body, Param, ParseIntPipe, HttpStatus } from '@nestjs/common';
import { IdiomaService } from '../services/idioma.service';
import { CreateIdiomaDto } from '../dto/create-idioma.dto';
import { UpdateIdiomaDto } from '../dto/update-idioma.dto';
import { Idioma } from '../entities/idioma.entity';

@Controller('idiomas')
export class IdiomaController {
    constructor(private readonly idiomaService: IdiomaService) {}

    @Post()
    async create(@Body() createIdiomaDto: CreateIdiomaDto): Promise<Idioma> {
        return await this.idiomaService.create(createIdiomaDto);
    }

    @Get()
    async findAll(): Promise<Idioma[]> {
        return await this.idiomaService.findAll();
    }

    @Get(':id')
    async findOne(@Param('id', new ParseIntPipe({ errorHttpStatusCode: HttpStatus.BAD_REQUEST })) id: number): Promise<Idioma> {
        return await this.idiomaService.findOne(id);
    }

    @Put(':id')
    async update(
        @Param('id', new ParseIntPipe({ errorHttpStatusCode: HttpStatus.BAD_REQUEST })) id: number,
        @Body() updateIdiomaDto: UpdateIdiomaDto
    ): Promise<Idioma> {
        return await this.idiomaService.update(id, updateIdiomaDto);
    }

    @Delete(':id')
    async remove(@Param('id', new ParseIntPipe({ errorHttpStatusCode: HttpStatus.BAD_REQUEST })) id: number): Promise<void> {
        return await this.idiomaService.remove(id);
    }
} 