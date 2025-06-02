import { IsNotEmpty, IsString, IsIn, IsNumber, IsOptional } from 'class-validator';
import { Transform } from 'class-transformer';

export class CreateLugarDto {
    @IsNotEmpty()
    @IsString()
    nombreLugar: string;

    @IsNotEmpty()
    @IsString()
    @IsIn(['ciudad', 'pais'])
    tipo: 'ciudad' | 'pais';

    @IsOptional()
    @IsNumber()
    @Transform(({ value }) => value ? Number(value) : null)
    idJerarquia?: number | null;
} 