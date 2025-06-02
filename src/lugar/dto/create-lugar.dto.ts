import { IsNotEmpty, IsString, IsNumber, IsOptional, IsIn, Length } from 'class-validator';

export class CreateLugarDto {
    @IsNotEmpty({ message: 'El nombre del lugar es requerido' })
    @IsString({ message: 'El nombre del lugar debe ser una cadena de texto' })
    @Length(2, 50, { message: 'El nombre del lugar debe tener entre 2 y 50 caracteres' })
    nombreLugar: string;

    @IsNotEmpty({ message: 'El tipo de lugar es requerido' })
    @IsString({ message: 'El tipo de lugar debe ser una cadena de texto' })
    @IsIn(['ciudad', 'pais'], { message: 'El tipo de lugar debe ser "ciudad" o "pais"' })
    tipo: 'ciudad' | 'pais';

    @IsOptional()
    @IsNumber({}, { message: 'El ID de jerarquía debe ser un número' })
    idJerarquia?: number;
} 