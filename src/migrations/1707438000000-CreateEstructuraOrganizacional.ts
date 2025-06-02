import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateEstructuraOrganizacional1707438000000 implements MigrationInterface {
    public async up(queryRunner: QueryRunner): Promise<void> {
        // Crear la secuencia
        await queryRunner.query(`
            CREATE SEQUENCE IF NOT EXISTS seq_estructura_org START WITH 1 INCREMENT BY 1;
        `);

        // Crear la tabla
        await queryRunner.query(`
            CREATE TABLE IF NOT EXISTS estructura_organizacional(
                id_museo NUMERIC NOT NULL,
                id_estructura_org NUMERIC DEFAULT nextval('seq_estructura_org') NOT NULL, 
                nombre VARCHAR(100) NOT NULL,
                nivel VARCHAR(50) NOT NULL, 
                tipo VARCHAR(50) NOT NULL,
                id_jerarquia_estructura NUMERIC,
                id_jerarquia_museo NUMERIC,
                CONSTRAINT ch_nivel CHECK(nivel IN('Nivel 1', 'Nivel 2', 'Nivel 3', 'Nivel 4')),
                CONSTRAINT ch_tipo CHECK(tipo IN('direccion', 'departamento', 'seccion', 'subdepartamento', 'subseccion')),
                CONSTRAINT fk_jerarquia FOREIGN KEY(id_jerarquia_museo, id_jerarquia_estructura) 
                    REFERENCES estructura_organizacional(id_museo, id_estructura_org),
                CONSTRAINT fk_museo FOREIGN KEY(id_museo) REFERENCES museo(id_museo),
                PRIMARY KEY(id_museo, id_estructura_org)
            );
        `);

        // Insertar una estructura organizacional inicial de nivel 1 para el museo 1 (si existe)
        await queryRunner.query(`
            INSERT INTO estructura_organizacional (id_museo, nombre, nivel, tipo)
            SELECT 1, 'Dirección General', 'Nivel 1', 'direccion'
            WHERE EXISTS (SELECT 1 FROM museo WHERE id_museo = 1);
        `);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE IF EXISTS estructura_organizacional;`);
        await queryRunner.query(`DROP SEQUENCE IF EXISTS seq_estructura_org;`);
    }
} 