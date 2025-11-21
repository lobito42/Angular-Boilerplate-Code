import { IsString, IsOptional, IsBoolean } from 'class-validator';
import { CreateExampleDto } from './create-example.dto';

export class UpdateExampleDto implements Partial<CreateExampleDto> {
  @IsString()
  @IsOptional()
  name?: string;

  @IsString()
  @IsOptional()
  description?: string;

  @IsBoolean()
  @IsOptional()
  active?: boolean;
}

