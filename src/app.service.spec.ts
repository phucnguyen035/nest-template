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

  it('should return the current environment', () => {
    const env = 'test';

    jest.spyOn(configService, 'get').mockReturnValueOnce(env);

    expect(service.getHello()).toHaveProperty('environment', env);
  });
});
