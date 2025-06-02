import { IsNotEmpty, IsString, IsNumber, IsOptional, IsIn, Length, ValidateIf, IsPositive } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateEstructuraOrganizacionalDto {
    @IsNotEmpty({ message: 'El ID del museo es requerido' })
    @IsNumber({}, { message: 'El ID del museo debe ser un número' })
    @IsPositive({ message: 'El ID del museo debe ser un número positivo' })
    @Type(() => Number)
    idMuseo: number;

    @IsNotEmpty({ message: 'El nombre de la estructura es requerido' })
    @IsString({ message: 'El nombre de la estructura debe ser una cadena de texto' })
    @Length(2, 100, { message: 'El nombre de la estructura debe tener entre 2 y 100 caracteres' })
    nombre: string;

    @IsNotEmpty({ message: 'El nivel es requerido' })
    @IsString({ message: 'El nivel debe ser una cadena de texto' })
    @IsIn(['Nivel 1', 'Nivel 2', 'Nivel 3', 'Nivel 4'], 
        { message: 'El nivel debe ser uno de: Nivel 1, Nivel 2, Nivel 3, Nivel 4' })
    nivel: string;

    @IsNotEmpty({ message: 'El tipo es requerido' })
    @IsString({ message: 'El tipo debe ser una cadena de texto' })
    @IsIn(['direccion', 'departamento', 'seccion', 'subdepartamento', 'subseccion'], 
        { message: 'El tipo debe ser uno de: direccion, departamento, seccion, subdepartamento, subseccion' })
    tipo: string;

    @ValidateIf(o => o.nivel !== 'Nivel 1')
    @IsNotEmpty({ message: 'El ID de jerarquía de estructura es requerido para niveles superiores a 1' })
    @IsNumber({}, { message: 'El ID de jerarquía de estructura debe ser un número' })
    @IsPositive({ message: 'El ID de jerarquía de estructura debe ser un número positivo' })
    @Type(() => Number)
    idJerarquiaEstructura?: number;

    @ValidateIf(o => o.nivel !== 'Nivel 1')
    @IsNotEmpty({ message: 'El ID de jerarquía de museo es requerido para niveles superiores a 1' })
    @IsNumber({}, { message: 'El ID de jerarquía de museo debe ser un número' })
    @IsPositive({ message: 'El ID de jerarquía de museo debe ser un número positivo' })
    @Type(() => Number)
    idJerarquiaMuseo?: number;

    // Método para validar la relación nivel-tipo
    validateNivelTipo(): boolean {
        const nivelTipoMap = {
            'Nivel 1': ['direccion'],
            'Nivel 2': ['departamento'],
            'Nivel 3': ['seccion', 'subdepartamento'],
            'Nivel 4': ['subseccion']
        };

        return nivelTipoMap[this.nivel]?.includes(this.tipo) ?? false;
    }
}

export class UpdateEstructuraOrganizacionalDto {
    @IsOptional()
    @IsString({ message: 'El nombre de la estructura debe ser una cadena de texto' })
    @Length(2, 100, { message: 'El nombre de la estructura debe tener entre 2 y 100 caracteres' })
    nombre?: string;

    @IsOptional()
    @IsString({ message: 'El nivel debe ser una cadena de texto' })
    @IsIn(['Nivel 1', 'Nivel 2', 'Nivel 3', 'Nivel 4'], 
        { message: 'El nivel debe ser uno de: Nivel 1, Nivel 2, Nivel 3, Nivel 4' })
    nivel?: string;

    @IsOptional()
    @IsString({ message: 'El tipo debe ser una cadena de texto' })
    @IsIn(['direccion', 'departamento', 'seccion', 'subdepartamento', 'subseccion'], 
        { message: 'El tipo debe ser uno de: direccion, departamento, seccion, subdepartamento, subseccion' })
    tipo?: string;

    @IsOptional()
    @IsNumber({}, { message: 'El ID de jerarquía de estructura debe ser un número' })
    @IsPositive({ message: 'El ID de jerarquía de estructura debe ser un número positivo' })
    @Type(() => Number)
    idJerarquiaEstructura?: number;

    @IsOptional()
    @IsNumber({}, { message: 'El ID de jerarquía de museo debe ser un número' })
    @IsPositive({ message: 'El ID de jerarquía de museo debe ser un número positivo' })
    @Type(() => Number)
    idJerarquiaMuseo?: number;
} 