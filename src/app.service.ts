import { Injectable } from '@nestjs/common';
import { hostname } from 'os';

@Injectable()
export class AppService {
  getHello(): string {
    return `Environment: ${
      process.env.NODE_ENV
    }. Current node is: ${hostname()}. It is currently: ${new Date().toLocaleString(
      'vi-vn',
    )}`;
  }
}
