import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { appConfig, databaseConfig } from './config';

@Module({
  imports: [
    ConfigModule.forRoot({ load: [appConfig, databaseConfig], isGlobal: true }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
