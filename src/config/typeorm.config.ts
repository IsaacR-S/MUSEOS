import { DataSource } from 'typeorm';
import { ConfigService } from '@nestjs/config';
import { config } from 'dotenv';
import { CreateEstructuraOrganizacional1707438000000 } from '../migrations/1707438000000-CreateEstructuraOrganizacional';

config();

const configService = new ConfigService();

export default new DataSource({
    type: 'postgres',
    host: 'localhost',
    port: 5432,
    username: 'postgres',
    password: 'isaac.2001',
    database: 'museos',
    entities: [__dirname + '/../**/*.entity{.ts,.js}'],
    migrations: [CreateEstructuraOrganizacional1707438000000],
    synchronize: false,
}); 