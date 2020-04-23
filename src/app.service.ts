import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class AppService {
  constructor(private configService: ConfigService) {}

  getHello(): { environment: string } {
    const env = this.configService.get('app.environment');

    return { environment: env };
  }
}
