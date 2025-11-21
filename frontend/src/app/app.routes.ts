import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    redirectTo: '/grid',
    pathMatch: 'full',
  },
  {
    path: 'grid',
    loadComponent: () =>
      import('./components/example-grid/example-grid.component').then(
        (m) => m.ExampleGridComponent
      ),
  },
];
