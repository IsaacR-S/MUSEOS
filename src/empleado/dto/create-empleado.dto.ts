import { IsNotEmpty, IsString, IsDate, IsNumber, IsOptional, IsArray } from 'class-validator';
import { Type } from 'class-transformer';

export class FormacionDto {
    @IsNotEmpty()
    @IsString()
    nombreTitulo: string;

    @IsNotEmpty()
    @Type(() => Date)
    @IsDate()
    ano: Date;

    @IsNotEmpty()
    @IsString()
    descripcionEspecialidad: string;
}

export class CreateEmpleadoDto {
    @IsNotEmpty()
    @IsString()
    primerNombre: string;

    @IsOptional()
    @IsString()
    segundoNombre?: string;

    @IsNotEmpty()
    @IsString()
    primerApellido: string;

    @IsNotEmpty()
    @IsString()
    segundoApellido: string;

    @IsNotEmpty()
    @Type(() => Date)
    @IsDate()
    fechaNacimiento: Date;

    @IsNotEmpty()
    @IsNumber()
    docIdentidad: number;

    @IsOptional()
    @IsString()
    datoContacto?: string;

    @IsArray()
    @IsNumber({}, { each: true })
    idiomasIds: number[]; // IDs de los idiomas que maneja

    @IsArray()
    @Type(() => FormacionDto)
    formaciones: FormacionDto[]; // Lista de formaciones profesionales
} 