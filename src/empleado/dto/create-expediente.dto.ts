import { Type } from 'class-transformer';
import { IsNotEmpty, IsString, IsOptional, IsNumber, IsDate, IsArray, ValidateNested } from 'class-validator';

class EmpleadoDto {
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
}

class FormacionDto {
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

class AsignacionDto {
    @IsNotEmpty()
    @IsNumber()
    idMuseo: number;

    @IsNotEmpty()
    @IsNumber()
    idEstructuraOrg: number;

    @IsNotEmpty()
    @IsString()
    rolEmpleado: string;

    @IsNotEmpty()
    @Type(() => Date)
    @IsDate()
    fechaInicio: Date;
}

export class CreateExpedienteDto {
    @ValidateNested()
    @Type(() => EmpleadoDto)
    empleado: EmpleadoDto;

    @IsArray()
    @ValidateNested({ each: true })
    @Type(() => FormacionDto)
    formaciones: FormacionDto[];

    @IsArray()
    @IsNumber({}, { each: true })
    idiomas: number[];

    @ValidateNested()
    @Type(() => AsignacionDto)
    asignacion: AsignacionDto;
} 