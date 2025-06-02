import { IsNotEmpty, IsString, Length } from 'class-validator';

export class CreateIdiomaDto {
    @IsNotEmpty({ message: 'El nombre del idioma no puede estar vacío' })
    @IsString({ message: 'El nombre del idioma debe ser una cadena de texto' })
    @Length(2, 50, { message: 'El nombre del idioma debe tener entre 2 y 50 caracteres' })
    nombre: string;
} 