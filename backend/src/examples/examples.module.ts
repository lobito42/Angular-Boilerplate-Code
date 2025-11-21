import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MongooseModule } from '@nestjs/mongoose';
import { ExamplesService } from './examples.service';
import { ExamplesController } from './examples.controller';
import { ExampleEntity } from '../entities/example.entity';
import { Example, ExampleSchema } from '../schemas/example.schema';
import { getTypeOrmConfig, getMongooseConfig } from '../config/database.config';

const dbType = process.env.DB_TYPE || 'sqlite';

const imports = [];

if (dbType === 'mongodb') {
  imports.push(MongooseModule.forRoot(getMongooseConfig().uri));
  imports.push(MongooseModule.forFeature([{ name: Example.name, schema: ExampleSchema }]));
} else {
  imports.push(TypeOrmModule.forRoot(getTypeOrmConfig()));
  imports.push(TypeOrmModule.forFeature([ExampleEntity]));
}

@Module({
  imports,
  controllers: [ExamplesController],
  providers: [ExamplesService],
})
export class ExamplesModule {}

