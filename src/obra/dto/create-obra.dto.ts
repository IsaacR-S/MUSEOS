import { IsNotEmpty, IsString, IsDate, IsArray, IsNumber, IsIn } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateObraDto {
    @IsNotEmpty({ message: 'El nombre de la obra es requerido' })
    @IsString({ message: 'El nombre debe ser una cadena de texto' })
    nombreObra: string;

    @IsNotEmpty({ message: 'La fecha/período es requerido' })
    @Type(() => Date)
    @IsDate({ message: 'La fecha/período debe ser una fecha válida' })
    fechaPeriodo: Date;

    @IsNotEmpty({ message: 'El tipo de obra es requerido' })
    @IsString({ message: 'El tipo debe ser una cadena de texto' })
    @IsIn(['pintura', 'escultura'], { message: 'El tipo debe ser pintura o escultura' })
    tipoObra: 'pintura' | 'escultura';

    @IsNotEmpty({ message: 'Las dimensiones son requeridas' })
    @IsString({ message: 'Las dimensiones deben ser una cadena de texto' })
    dimensiones: string;

    @IsNotEmpty({ message: 'El estilo es requerido' })
    @IsString({ message: 'El estilo debe ser una cadena de texto' })
    estiloDescripcion: string;

    @IsNotEmpty({ message: 'La descripción de materiales y técnicas es requerida' })
    @IsString({ message: 'La descripción debe ser una cadena de texto' })
    descripcionMaterialesTecnicas: string;

    @IsArray({ message: 'Los IDs de artistas deben ser un arreglo' })
    @IsNumber({}, { each: true, message: 'Cada ID de artista debe ser un número' })
    artistasIds: number[];
} 