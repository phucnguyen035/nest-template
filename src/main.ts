import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import helmet from 'helmet';
import { join } from 'path';
import serveFavicon from 'serve-favicon';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });
  const config = app.get(ConfigService);
  const port = config.get<number>('app.port');

  app.use(helmet.hidePoweredBy());
  app.use(serveFavicon(join(__dirname, '../', 'favicon.ico')));

  await app.listen(port);
}
bootstrap();
