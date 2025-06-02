import { Injectable, NotFoundException, InternalServerErrorException, BadRequestException, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { EstructuraOrganizacional } from '../entities/estructura-organizacional.entity';
import { CreateEstructuraOrganizacionalDto, UpdateEstructuraOrganizacionalDto } from '../dto/create-estructura-organizacional.dto';

@Injectable()
export class EstructuraOrganizacionalService {
    private readonly logger = new Logger(EstructuraOrganizacionalService.name);
    private readonly nivelNumerico = {
        'Nivel 1': 1,
        'Nivel 2': 2,
        'Nivel 3': 3,
        'Nivel 4': 4
    };

    constructor(
        @InjectRepository(EstructuraOrganizacional)
        private estructuraRepository: Repository<EstructuraOrganizacional>
    ) {}

    async create(createEstructuraDto: CreateEstructuraOrganizacionalDto): Promise<EstructuraOrganizacional> {
        try {
            // Validar la relación nivel-tipo
            if (!createEstructuraDto.validateNivelTipo()) {
                throw new BadRequestException(
                    `El tipo "${createEstructuraDto.tipo}" no es válido para el nivel "${createEstructuraDto.nivel}"`
                );
            }

            // Si no es Nivel 1, verificar que tenga una jerarquía superior
            if (createEstructuraDto.nivel !== 'Nivel 1') {
                if (!createEstructuraDto.idJerarquiaEstructura || !createEstructuraDto.idJerarquiaMuseo) {
                    throw new BadRequestException(
                        `Las estructuras de ${createEstructuraDto.nivel} deben tener una estructura superior`
                    );
                }

                // Verificar que la estructura superior existe y es del nivel inmediatamente superior
                const estructuraSuperior = await this.findOne(
                    createEstructuraDto.idJerarquiaMuseo, 
                    createEstructuraDto.idJerarquiaEstructura
                );

                const nivelActual = this.nivelNumerico[createEstructuraDto.nivel];
                const nivelSuperior = this.nivelNumerico[estructuraSuperior.nivel];

                if (nivelActual !== nivelSuperior + 1) {
                    throw new BadRequestException(
                        'La estructura superior debe ser del nivel inmediatamente anterior'
                    );
                }

                // Verificar que la estructura superior sea del tipo correcto según el nivel
                const tiposSuperiorValidos = {
                    'Nivel 2': ['direccion'],
                    'Nivel 3': ['departamento'],
                    'Nivel 4': ['seccion', 'subdepartamento']
                };

                if (!tiposSuperiorValidos[createEstructuraDto.nivel]?.includes(estructuraSuperior.tipo)) {
                    throw new BadRequestException(
                        'El tipo de la estructura superior no es válido para este nivel'
                    );
                }
            } else {
                // Si es Nivel 1, no debe tener jerarquía superior
                createEstructuraDto.idJerarquiaEstructura = null;
                createEstructuraDto.idJerarquiaMuseo = null;
            }

            // Generar el siguiente ID de estructura organizacional
            const maxId = await this.estructuraRepository
                .createQueryBuilder('eo')
                .where('eo.idMuseo = :idMuseo', { idMuseo: createEstructuraDto.idMuseo })
                .select('MAX(eo.idEstructuraOrg)', 'maxId')
                .getRawOne();

            const nextId = (maxId?.maxId || 0) + 1;

            const estructura = this.estructuraRepository.create({
                ...createEstructuraDto,
                idEstructuraOrg: nextId
            });

            return await this.estructuraRepository.save(estructura);
        } catch (error) {
            if (error instanceof BadRequestException || error instanceof NotFoundException) {
                throw error;
            }
            throw new InternalServerErrorException('Error al crear la estructura organizacional');
        }
    }

    async findAll(): Promise<EstructuraOrganizacional[]> {
        try {
            this.logger.log('Intentando obtener todas las estructuras organizacionales');
            
            // Crear una consulta más detallada
            const query = this.estructuraRepository.createQueryBuilder('eo')
                .select([
                    'eo.idMuseo',
                    'eo.idEstructuraOrg',
                    'eo.nombre',
                    'eo.nivel',
                    'eo.tipo',
                    'eo.idJerarquiaEstructura',
                    'eo.idJerarquiaMuseo'
                ])
                .leftJoinAndSelect('eo.museo', 'museo')
                .leftJoinAndSelect('eo.jerarquia', 'jerarquia');

            // Log de la consulta SQL
            this.logger.debug(`Query SQL: ${query.getSql()}`);
            
            const estructuras = await query.getMany();
            
            // Log detallado de los resultados
            this.logger.log(`Total de estructuras encontradas: ${estructuras.length}`);
            if (estructuras.length > 0) {
                estructuras.forEach(estructura => {
                    this.logger.debug(`Estructura encontrada: 
                        ID Museo: ${estructura.idMuseo}
                        ID Estructura: ${estructura.idEstructuraOrg}
                        Nombre: ${estructura.nombre}
                        Nivel: ${estructura.nivel}
                        Tipo: ${estructura.tipo}
                        Jerarquía Estructura: ${estructura.idJerarquiaEstructura}
                        Jerarquía Museo: ${estructura.idJerarquiaMuseo}
                    `);
                });
            } else {
                this.logger.warn('No se encontraron estructuras organizacionales');
            }

            return estructuras;
        } catch (error) {
            this.logger.error(`Error al obtener las estructuras: ${error.message}`, error.stack);
            throw new InternalServerErrorException(
                `Error al obtener las estructuras organizacionales: ${error.message}`
            );
        }
    }

    async findOne(idMuseo: number, idEstructuraOrg: number): Promise<EstructuraOrganizacional> {
        const estructura = await this.estructuraRepository.findOne({
            where: { 
                idMuseo,
                idEstructuraOrg
            },
            relations: ['jerarquia', 'subestructuras', 'museo']
        });

        if (!estructura) {
            throw new NotFoundException(`No se encontró la estructura organizacional con ID ${idEstructuraOrg} en el museo ${idMuseo}`);
        }

        return estructura;
    }

    async findByMuseo(idMuseo: number): Promise<EstructuraOrganizacional[]> {
        try {
            this.logger.log(`Intentando obtener estructuras organizacionales para el museo ${idMuseo}`);
            
            // Crear una consulta más detallada
            const query = this.estructuraRepository.createQueryBuilder('eo')
                .select([
                    'eo.idMuseo',
                    'eo.idEstructuraOrg',
                    'eo.nombre',
                    'eo.nivel',
                    'eo.tipo',
                    'eo.idJerarquiaEstructura',
                    'eo.idJerarquiaMuseo'
                ])
                .where('eo.idMuseo = :idMuseo', { idMuseo })
                .leftJoinAndSelect('eo.museo', 'museo')
                .leftJoinAndSelect('eo.jerarquia', 'jerarquia')
                .orderBy('eo.nivel', 'ASC')
                .addOrderBy('eo.idEstructuraOrg', 'ASC');

            // Log de la consulta SQL
            this.logger.debug(`Query SQL para museo ${idMuseo}: ${query.getSql()}`);
            
            const estructuras = await query.getMany();
            
            // Log detallado de los resultados
            this.logger.log(`Total de estructuras encontradas para el museo ${idMuseo}: ${estructuras.length}`);
            if (estructuras.length > 0) {
                estructuras.forEach(estructura => {
                    this.logger.debug(`Estructura encontrada: 
                        ID Museo: ${estructura.idMuseo}
                        ID Estructura: ${estructura.idEstructuraOrg}
                        Nombre: ${estructura.nombre}
                        Nivel: ${estructura.nivel}
                        Tipo: ${estructura.tipo}
                        Jerarquía Estructura: ${estructura.idJerarquiaEstructura}
                        Jerarquía Museo: ${estructura.idJerarquiaMuseo}
                    `);
                });
            } else {
                this.logger.warn(`No se encontraron estructuras organizacionales para el museo ${idMuseo}`);
                
                // Verificar si el museo existe
                const rawQuery = `SELECT EXISTS(SELECT 1 FROM museo WHERE id_museo = $1)`;
                const result = await this.estructuraRepository.query(rawQuery, [idMuseo]);
                if (result[0].exists) {
                    this.logger.warn(`El museo ${idMuseo} existe pero no tiene estructuras organizacionales`);
                } else {
                    this.logger.warn(`El museo ${idMuseo} no existe en la base de datos`);
                }

                // Verificar la tabla estructura_organizacional
                const tableQuery = `
                    SELECT COUNT(*) 
                    FROM information_schema.tables 
                    WHERE table_schema = 'public' 
                    AND table_name = 'estructura_organizacional'
                `;
                const tableResult = await this.estructuraRepository.query(tableQuery);
                if (tableResult[0].count === '0') {
                    this.logger.error('La tabla estructura_organizacional no existe en la base de datos');
                } else {
                    // Contar todas las estructuras
                    const countQuery = `SELECT COUNT(*) FROM estructura_organizacional`;
                    const countResult = await this.estructuraRepository.query(countQuery);
                    this.logger.log(`Total de estructuras en la base de datos: ${countResult[0].count}`);
                }
            }
            
            return estructuras;
        } catch (error) {
            this.logger.error(`Error al obtener estructuras del museo ${idMuseo}: ${error.message}`, error.stack);
            throw new InternalServerErrorException(
                `Error al obtener las estructuras organizacionales del museo: ${error.message}`
            );
        }
    }

    async remove(idMuseo: number, idEstructuraOrg: number): Promise<void> {
        try {
            const estructura = await this.findOne(idMuseo, idEstructuraOrg);
            
            // Verificar si tiene subestructuras
            const subestructuras = await this.estructuraRepository.find({
                where: {
                    idJerarquiaMuseo: idMuseo,
                    idJerarquiaEstructura: idEstructuraOrg
                }
            });

            if (subestructuras.length > 0) {
                throw new BadRequestException('No se puede eliminar una estructura que tiene subestructuras');
            }

            await this.estructuraRepository.remove(estructura);
        } catch (error) {
            if (error instanceof BadRequestException || error instanceof NotFoundException) {
                throw error;
            }
            throw new InternalServerErrorException('Error al eliminar la estructura organizacional');
        }
    }

    async update(
        idMuseo: number, 
        idEstructuraOrg: number, 
        updateEstructuraDto: UpdateEstructuraOrganizacionalDto
    ): Promise<EstructuraOrganizacional> {
        try {
            this.logger.log(`Actualizando estructura organizacional ${idEstructuraOrg} del museo ${idMuseo}`);

            // Verificar que la estructura existe
            const estructura = await this.findOne(idMuseo, idEstructuraOrg);

            // Si se está actualizando el nivel o tipo, validar la relación
            if (updateEstructuraDto.nivel || updateEstructuraDto.tipo) {
                const nivel = updateEstructuraDto.nivel || estructura.nivel;
                const tipo = updateEstructuraDto.tipo || estructura.tipo;

                const nivelTipoMap = {
                    'Nivel 1': ['direccion'],
                    'Nivel 2': ['departamento'],
                    'Nivel 3': ['seccion', 'subdepartamento'],
                    'Nivel 4': ['subseccion']
                };

                if (!nivelTipoMap[nivel]?.includes(tipo)) {
                    throw new BadRequestException(
                        `El tipo "${tipo}" no es válido para el nivel "${nivel}"`
                    );
                }
            }

            // Si se está actualizando la jerarquía, validar
            if (updateEstructuraDto.idJerarquiaEstructura || updateEstructuraDto.idJerarquiaMuseo) {
                const idJerarquiaEstructura = updateEstructuraDto.idJerarquiaEstructura || estructura.idJerarquiaEstructura;
                const idJerarquiaMuseo = updateEstructuraDto.idJerarquiaMuseo || estructura.idJerarquiaMuseo;

                if (idJerarquiaEstructura && idJerarquiaMuseo) {
                    const estructuraSuperior = await this.findOne(idJerarquiaMuseo, idJerarquiaEstructura);
                    
                    // Verificar que no se cree un ciclo
                    if (await this.crearaCiclo(estructura, estructuraSuperior)) {
                        throw new BadRequestException(
                            'La actualización crearía un ciclo en la jerarquía'
                        );
                    }
                }
            }

            // Actualizar la estructura
            Object.assign(estructura, updateEstructuraDto);
            const result = await this.estructuraRepository.save(estructura);
            
            this.logger.log(`Estructura organizacional actualizada exitosamente`);
            return result;

        } catch (error) {
            this.logger.error(`Error al actualizar estructura ${idEstructuraOrg} del museo ${idMuseo}: ${error.message}`, error.stack);
            if (error instanceof BadRequestException || error instanceof NotFoundException) {
                throw error;
            }
            throw new InternalServerErrorException(
                `Error al actualizar la estructura organizacional: ${error.message}`
            );
        }
    }

    private async crearaCiclo(
        estructura: EstructuraOrganizacional,
        nuevaJerarquia: EstructuraOrganizacional
    ): Promise<boolean> {
        let actual = nuevaJerarquia;
        const visitados = new Set<string>();

        while (actual) {
            const key = `${actual.idMuseo}-${actual.idEstructuraOrg}`;
            if (key === `${estructura.idMuseo}-${estructura.idEstructuraOrg}`) {
                return true;
            }
            if (visitados.has(key)) {
                return false;
            }
            visitados.add(key);

            if (!actual.idJerarquiaMuseo || !actual.idJerarquiaEstructura) {
                return false;
            }

            actual = await this.findOne(actual.idJerarquiaMuseo, actual.idJerarquiaEstructura);
        }

        return false;
    }
} 