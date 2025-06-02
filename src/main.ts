import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { NestExpressApplication } from '@nestjs/platform-express';
import { join } from 'path';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  
  // Configuración de CORS
  app.enableCors();
  
  // Configuración de validación global
  app.useGlobalPipes(new ValidationPipe({
    transform: true,
    whitelist: true,
  }));

  // Configuración de archivos estáticos
  app.useStaticAssets(join(__dirname, '..', 'src', 'public'), {
    index: 'index.html'
  });

  // Configuración del puerto
  const port = process.env.PORT || 3000;
  console.log(`Aplicación iniciando en el puerto ${port}`);
  
  try {
    await app.listen(port);
    console.log(`Aplicación corriendo en: http://localhost:${port}`);
  } catch (error) {
    console.error('Error al iniciar la aplicación:', error);
  }
}
bootstrap(); 