import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import { MongooseModuleOptions } from '@nestjs/mongoose';

export interface DatabaseConfig {
  type: 'mongodb' | 'postgresql' | 'sqlite';
}

export const getTypeOrmConfig = (): TypeOrmModuleOptions => {
  const dbType = process.env.DB_TYPE || 'sqlite';

  if (dbType === 'postgresql') {
    return {
      type: 'postgres',
      host: process.env.POSTGRES_HOST || 'localhost',
      port: parseInt(process.env.POSTGRES_PORT || '5432', 10),
      username: process.env.POSTGRES_USER || 'postgres',
      password: process.env.POSTGRES_PASSWORD || 'postgres',
      database: process.env.POSTGRES_DB || 'boilerplate',
      entities: [__dirname + '/../**/*.entity{.ts,.js}'],
      synchronize: process.env.NODE_ENV !== 'production',
      logging: process.env.NODE_ENV === 'development',
    };
  }

  // SQLite default
  return {
    type: 'sqlite',
    database: process.env.SQLITE_DB_PATH || './data/boilerplate.db',
    entities: [__dirname + '/../**/*.entity{.ts,.js}'],
    synchronize: process.env.NODE_ENV !== 'production',
    logging: process.env.NODE_ENV === 'development',
  };
};

export const getMongooseConfig = (): MongooseModuleOptions => {
  return {
    uri: process.env.MONGODB_URI || 'mongodb://localhost:27017/boilerplate',
  };
};

