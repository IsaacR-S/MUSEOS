import { Controller, Get, Post, Body, Param, Delete, HttpException, HttpStatus, Logger } from '@nestjs/common';
import { EmpleadoService } from '../services/empleado.service';
import { CreateExpedienteDto } from '../dto/create-expediente.dto';

@Controller('empleados')
export class EmpleadoController {
    private readonly logger = new Logger(EmpleadoController.name);

    constructor(private readonly empleadoService: EmpleadoService) {}

    @Post('expediente')
    async createExpediente(@Body() createExpedienteDto: CreateExpedienteDto) {
        try {
            this.logger.log(`Creando expediente de empleado: ${JSON.stringify(createExpedienteDto)}`);
            const result = await this.empleadoService.createExpediente(createExpedienteDto);
            this.logger.log(`Expediente creado: ${JSON.stringify(result)}`);
            return result;
        } catch (error) {
            this.logger.error(`Error al crear expediente: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al crear el expediente',
                error.status || HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Get()
    async findAll() {
        try {
            return await this.empleadoService.findAll();
        } catch (error) {
            this.logger.error(`Error al obtener empleados: ${error.message}`, error.stack);
            throw new HttpException(
                'Error al obtener los empleados',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @Delete(':id')
    async remove(@Param('id') id: string) {
        try {
            await this.empleadoService.remove(+id);
            return { message: 'Empleado eliminado exitosamente' };
        } catch (error) {
            this.logger.error(`Error al eliminar empleado: ${error.message}`, error.stack);
            throw new HttpException(
                error.message || 'Error al eliminar el empleado',
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }
} 