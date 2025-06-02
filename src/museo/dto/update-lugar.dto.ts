import { IsString, IsIn, IsNumber, IsOptional } from 'class-validator';

export class UpdateLugarDto {
    @IsOptional()
    @IsString()
    nombreLugar?: string;

    @IsOptional()
    @IsString()
    @IsIn(['ciudad', 'pais'])
    tipo?: 'ciudad' | 'pais';

    @IsOptional()
    @IsNumber()
    idJerarquia?: number;
} 