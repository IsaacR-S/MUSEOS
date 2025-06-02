import { IsNotEmpty, IsString, IsDate, IsNumber, MaxLength } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateResumenHistoricoDto {
    @IsNotEmpty({ message: 'El ID del museo es requerido' })
    @IsNumber({}, { message: 'El ID del museo debe ser un número' })
    idMuseo: number;

    @IsNotEmpty({ message: 'El año es requerido' })
    @Type(() => Date)
    @IsDate({ message: 'El año debe ser una fecha válida' })
    ano: Date;

    @IsNotEmpty({ message: 'Los hechos históricos son requeridos' })
    @IsString({ message: 'Los hechos históricos deben ser una cadena de texto' })
    @MaxLength(350, { message: 'Los hechos históricos no pueden exceder los 350 caracteres' })
    hechosHist: string;
} 