import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import os from 'os';

@Injectable()
export class AppService {
  constructor(private configService: ConfigService) {}

  getHello(): { environment: string; hostname: string } {
    const environment = this.configService.get('app.environment');
    const hostname = os.hostname();

    return { environment, hostname };
  }
}
