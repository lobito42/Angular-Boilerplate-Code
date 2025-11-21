import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ExampleGridComponent } from './example-grid.component';
import { ApiService } from '../../services/api.service';
import { of } from 'rxjs';

describe('ExampleGridComponent', () => {
  let component: ExampleGridComponent;
  let fixture: ComponentFixture<ExampleGridComponent>;
  let apiService: jasmine.SpyObj<ApiService>;

  beforeEach(async () => {
    const apiServiceSpy = jasmine.createSpyObj('ApiService', ['getExamples']);

    await TestBed.configureTestingModule({
      imports: [ExampleGridComponent],
      providers: [{ provide: ApiService, useValue: apiServiceSpy }],
    }).compileComponents();

    fixture = TestBed.createComponent(ExampleGridComponent);
    component = fixture.componentInstance;
    apiService = TestBed.inject(ApiService) as jasmine.SpyObj<ApiService>;
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should load examples on init', () => {
    const mockExamples = [
      { id: 1, name: 'Test', description: 'Test Description', active: true },
    ];
    apiService.getExamples.and.returnValue(of(mockExamples));

    component.ngOnInit();

    expect(apiService.getExamples).toHaveBeenCalled();
  });
});

