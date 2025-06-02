import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, DataSource } from 'typeorm';
import { EmpleadoProfesional } from '../entities/empleado.entity';
import { FormacionProfesional } from '../entities/formacion.entity';
import { AsignacionLaboral } from '../entities/asignacion.entity';
import { EmpleadoIdioma } from '../entities/empleado-idioma.entity';
import { CreateExpedienteDto } from '../dto/create-expediente.dto';

@Injectable()
export class EmpleadoService {
    constructor(
        @InjectRepository(EmpleadoProfesional)
        private empleadoRepository: Repository<EmpleadoProfesional>,
        @InjectRepository(FormacionProfesional)
        private formacionRepository: Repository<FormacionProfesional>,
        @InjectRepository(AsignacionLaboral)
        private asignacionRepository: Repository<AsignacionLaboral>,
        @InjectRepository(EmpleadoIdioma)
        private empleadoIdiomaRepository: Repository<EmpleadoIdioma>,
        private dataSource: DataSource
    ) {}

    async createExpediente(createExpedienteDto: CreateExpedienteDto) {
        const queryRunner = this.dataSource.createQueryRunner();
        await queryRunner.connect();
        await queryRunner.startTransaction();

        try {
            // 1. Crear empleado
            const empleado = this.empleadoRepository.create(createExpedienteDto.empleado);
            const empleadoGuardado = await queryRunner.manager.save(empleado);

            // 2. Crear formaciones
            const formaciones = createExpedienteDto.formaciones.map(formacion => {
                const formacionEntity = this.formacionRepository.create(formacion);
                formacionEntity.idEmpleadoProf = empleadoGuardado.idEmpleadoProf;
                return formacionEntity;
            });
            await queryRunner.manager.save(FormacionProfesional, formaciones);

            // 3. Crear asignación laboral
            const asignacion = this.asignacionRepository.create({
                ...createExpedienteDto.asignacion,
                idEmpleadoProf: empleadoGuardado.idEmpleadoProf
            });
            await queryRunner.manager.save(asignacion);

            // 4. Crear relaciones con idiomas
            const idiomasRelaciones = createExpedienteDto.idiomas.map(idIdioma => ({
                idEmpleadoProf: empleadoGuardado.idEmpleadoProf,
                idIdioma
            }));
            await queryRunner.manager.save(EmpleadoIdioma, idiomasRelaciones);

            await queryRunner.commitTransaction();
            return empleadoGuardado;
        } catch (error) {
            await queryRunner.rollbackTransaction();
            throw new HttpException(
                'Error al crear el expediente: ' + error.message,
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        } finally {
            await queryRunner.release();
        }
    }

    async findAll() {
        return this.empleadoRepository.find({
            relations: ['formaciones', 'asignaciones', 'idiomas']
        });
    }

    async remove(id: number) {
        const queryRunner = this.dataSource.createQueryRunner();
        await queryRunner.connect();
        await queryRunner.startTransaction();

        try {
            // Verificar si el empleado existe
            const empleado = await this.empleadoRepository.findOne({ where: { idEmpleadoProf: id } });
            if (!empleado) {
                throw new HttpException('Empleado no encontrado', HttpStatus.NOT_FOUND);
            }

            // Eliminar registros relacionados
            await queryRunner.manager.delete(EmpleadoIdioma, { idEmpleadoProf: id });
            await queryRunner.manager.delete(FormacionProfesional, { idEmpleadoProf: id });
            await queryRunner.manager.delete(AsignacionLaboral, { idEmpleadoProf: id });
            await queryRunner.manager.delete(EmpleadoProfesional, { idEmpleadoProf: id });

            await queryRunner.commitTransaction();
        } catch (error) {
            await queryRunner.rollbackTransaction();
            throw error;
        } finally {
            await queryRunner.release();
        }
    }
} 