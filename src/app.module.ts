import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule } from '@nestjs/config';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { MuseoModule } from './museo/museo.module';
import { EmpleadoModule } from './empleado/empleado.module';
import { IdiomaModule } from './idioma/idioma.module';
import { ObraModule } from './obra/obra.module';
import { EstructuraOrganizacionalModule } from './estructura-organizacional/estructura-organizacional.module';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { LugarModule } from './lugar/lugar.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      username: 'postgres',
      password: 'isaac.2001',
      database: 'museos',
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: false,
      logging: true,
    }),
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', 'public'),
      exclude: ['/api*'],
    }),
    LugarModule,
    MuseoModule,
    EmpleadoModule,
    IdiomaModule,
    ObraModule,
    EstructuraOrganizacionalModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {} 