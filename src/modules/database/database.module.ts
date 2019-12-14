import { Module } from '@nestjs/common';

// Use this when using Knex/Objection
// const databaseProvider: FactoryProvider = {
//   provide: 'KNEX_CONNECTION',
//   inject: [ConfigService],

//   useFactory: async (configService: ConfigService) => {
//     const knex = Knex({
//       client: configService.get<string>('database.type'),
//       connection: configService.get<ConnectionConfig>('database.connection'),
//       useNullAsDefault: false,
//       debug: process.env.NODE_ENV === 'development',
//       ...knexSnakeCaseMappers(),
//     });

//     Model.knex(knex);

//     return knex;
//   },
// };

@Module({
  providers: [],
  exports: [],
})
export class DatabaseModule {}
