import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return `Environment: ${
      process.env.NODE_ENV
    }. It is currently: ${new Date().toLocaleString('vi-vn')}`;
  }
}
