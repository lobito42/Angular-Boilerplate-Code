import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Example {
  id?: number | string;
  name: string;
  description?: string;
  active?: boolean;
  createdAt?: Date;
  updatedAt?: Date;
}

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  private apiUrl = 'http://localhost:3000';

  constructor(private http: HttpClient) {}

  getExamples(): Observable<Example[]> {
    return this.http.get<Example[]>(`${this.apiUrl}/examples`);
  }

  getExample(id: string | number): Observable<Example> {
    return this.http.get<Example>(`${this.apiUrl}/examples/${id}`);
  }

  createExample(example: Partial<Example>): Observable<Example> {
    return this.http.post<Example>(`${this.apiUrl}/examples`, example);
  }

  updateExample(id: string | number, example: Partial<Example>): Observable<Example> {
    return this.http.patch<Example>(`${this.apiUrl}/examples/${id}`, example);
  }

  deleteExample(id: string | number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/examples/${id}`);
  }
}

