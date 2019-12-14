import { NestFactory } from '@nestjs/core';
import helmet from 'helmet';
import { join } from 'path';
import serveFavicon from 'serve-favicon';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });

  app.use(helmet.hidePoweredBy());
  app.use(serveFavicon(join(__dirname, '../', 'favicon.ico')));

  await app.listen(3000);
}
bootstrap();
