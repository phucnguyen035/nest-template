import { NestFactory } from '@nestjs/core';
import { join } from 'path';
import serveFavicon from 'serve-favicon';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.use(serveFavicon(join(__dirname, '../', 'favicon.ico')));

  await app.listen(3000);
}
bootstrap();
