import { Component, OnInit } from '@angular/core';
import { AgGridAngular } from '@ag-grid-community/angular';
import { ColDef, GridApi, GridReadyEvent } from '@ag-grid-community/core';
import { ApiService, Example } from '../../services/api.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-example-grid',
  standalone: true,
  imports: [AgGridAngular, CommonModule],
  templateUrl: './example-grid.component.html',
  styleUrl: './example-grid.component.css',
})
export class ExampleGridComponent implements OnInit {
  private gridApi!: GridApi<Example>;

  columnDefs: ColDef[] = [
    { field: 'id', headerName: 'ID', width: 100 },
    { field: 'name', headerName: 'Name', flex: 1 },
    { field: 'description', headerName: 'Description', flex: 2 },
    {
      field: 'active',
      headerName: 'Active',
      width: 100,
      cellRenderer: (params: any) => (params.value ? '✓' : '✗'),
    },
    {
      field: 'createdAt',
      headerName: 'Created',
      width: 180,
      valueFormatter: (params: any) => {
        if (!params.value) return '';
        return new Date(params.value).toLocaleString();
      },
    },
  ];

  defaultColDef: ColDef = {
    sortable: true,
    filter: true,
    resizable: true,
  };

  rowData: Example[] = [];
  loading = false;

  constructor(private apiService: ApiService) {}

  ngOnInit(): void {
    this.loadExamples();
  }

  onGridReady(params: GridReadyEvent<Example>): void {
    this.gridApi = params.api;
  }

  loadExamples(): void {
    this.loading = true;
    this.apiService.getExamples().subscribe({
      next: (data) => {
        this.rowData = data;
        this.loading = false;
      },
      error: (error) => {
        console.error('Error loading examples:', error);
        this.loading = false;
      },
    });
  }

  refreshGrid(): void {
    this.loadExamples();
  }
}

