import { registerAs } from '@nestjs/config';

export default registerAs('database', () => ({
  // Defaults to postgres
  type: process.env.DB_TYPE || 'postgres',
  connection: {
    host: process.env.DB_HOST || 'localhost',
    port: parseInt(process.env.DB_PORT, 10) || 5432,
    user: process.env.DB_USERNAME || 'postgres',
    database: process.env.DB_DATABASE || 'postgres',
    password: process.env.DB_PASSWORD,
  },
}));
