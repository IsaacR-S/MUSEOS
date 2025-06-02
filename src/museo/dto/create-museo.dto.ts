import { IsNotEmpty, IsString, IsDate, IsNumber, IsOptional, Length, MaxLength } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateMuseoDto {
    @IsNotEmpty({ message: 'El nombre del museo es requerido' })
    @IsString({ message: 'El nombre debe ser una cadena de texto' })
    @Length(2, 50, { message: 'El nombre debe tener entre 2 y 50 caracteres' })
    nombre: string;

    @IsOptional()
    @IsString({ message: 'La misión debe ser una cadena de texto' })
    @MaxLength(350, { message: 'La misión no puede exceder los 350 caracteres' })
    mision?: string;

    @IsNotEmpty({ message: 'La fecha de fundación es requerida' })
    @Type(() => Date)
    @IsDate({ message: 'La fecha de fundación debe ser una fecha válida' })
    fechaFundacion: Date;

    @IsNotEmpty({ message: 'El ID del lugar es requerido' })
    @IsNumber({}, { message: 'El ID del lugar debe ser un número' })
    idLugar: number;
} 