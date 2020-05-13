import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { AppModule } from './../src/app.module';
import os from 'os';

describe('AppController (e2e)', () => {
  let app: INestApplication;

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  it('/ (GET)', () => {
    const hostname = 'abc';
    jest.spyOn(os, 'hostname').mockReturnValueOnce(hostname);

    return request(app.getHttpServer())
      .get('/')
      .expect(200, { environment: 'test', hostname });
  });
});
