import { Test, TestingModule } from '@nestjs/testing';
import { ExamplesService } from './examples.service';
import { getRepositoryToken } from '@nestjs/typeorm';
import { getModelToken } from '@nestjs/mongoose';
import { ExampleEntity } from '../entities/example.entity';
import { Example } from '../schemas/example.schema';

describe('ExamplesService', () => {
  let service: ExamplesService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        ExamplesService,
        {
          provide: getRepositoryToken(ExampleEntity),
          useValue: {
            create: jest.fn(),
            save: jest.fn(),
            find: jest.fn(),
            findOne: jest.fn(),
            update: jest.fn(),
            remove: jest.fn(),
          },
        },
        {
          provide: getModelToken(Example.name),
          useValue: {
            create: jest.fn(),
            find: jest.fn(),
            findById: jest.fn(),
            findByIdAndUpdate: jest.fn(),
            findByIdAndDelete: jest.fn(),
          },
        },
      ],
    }).compile();

    service = module.get<ExamplesService>(ExamplesService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});

