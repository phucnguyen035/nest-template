import os from 'os';
import { ConfigService } from '@nestjs/config';
import { Test, TestingModule } from '@nestjs/testing';
import { AppService } from './app.service';

describe('AppService', () => {
  let service: AppService;
  let configService: ConfigService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AppService, ConfigService],
    }).compile();

    service = module.get(AppService);
    configService = module.get(ConfigService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should return the current environment and host name', () => {
    const env = 'test';
    const hostname = 'abc';

    jest.spyOn(configService, 'get').mockReturnValueOnce(env);
    jest.spyOn(os, 'hostname').mockReturnValueOnce(hostname);

    const res = service.getHello();

    expect(res).toHaveProperty('environment', env);
    expect(res).toHaveProperty('hostname', hostname);
  });
});
