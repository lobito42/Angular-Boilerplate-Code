import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateExampleDto } from '../dto/create-example.dto';
import { UpdateExampleDto } from '../dto/update-example.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ExampleEntity } from '../entities/example.entity';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Example, ExampleDocument } from '../schemas/example.schema';

@Injectable()
export class ExamplesService {
  private dbType: string;

  constructor(
    @InjectRepository(ExampleEntity)
    private readonly typeOrmRepository: Repository<ExampleEntity>,
    @InjectModel(Example.name)
    private readonly mongooseModel: Model<ExampleDocument>,
  ) {
    this.dbType = process.env.DB_TYPE || 'sqlite';
  }

  async create(createExampleDto: CreateExampleDto) {
    if (this.dbType === 'mongodb') {
      const created = new this.mongooseModel(createExampleDto);
      return created.save();
    }
    const entity = this.typeOrmRepository.create(createExampleDto);
    return this.typeOrmRepository.save(entity);
  }

  async findAll() {
    if (this.dbType === 'mongodb') {
      return this.mongooseModel.find().exec();
    }
    return this.typeOrmRepository.find();
  }

  async findOne(id: string) {
    let result;
    if (this.dbType === 'mongodb') {
      result = await this.mongooseModel.findById(id).exec();
    } else {
      result = await this.typeOrmRepository.findOne({ where: { id: parseInt(id, 10) } });
    }

    if (!result) {
      throw new NotFoundException(`Example with ID ${id} not found`);
    }
    return result;
  }

  async update(id: string, updateExampleDto: UpdateExampleDto) {
    await this.findOne(id); // Check if exists

    if (this.dbType === 'mongodb') {
      return this.mongooseModel.findByIdAndUpdate(id, updateExampleDto, { new: true }).exec();
    }
    await this.typeOrmRepository.update(id, updateExampleDto);
    return this.findOne(id);
  }

  async remove(id: string) {
    const example = await this.findOne(id); // Check if exists

    if (this.dbType === 'mongodb') {
      return this.mongooseModel.findByIdAndDelete(id).exec();
    }
    return this.typeOrmRepository.remove(example);
  }
}

