import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { Category } from '../models/category.model';
import { Rune } from '../models/rune.model';
import { RunePage } from '../models/rune_page.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root',
})
export class RunePageService {
  constructor(private api: ApiRequestService) {}
  log(info: string, data: any) {
    console.log(`[API-RUNE-PAGE-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error('[API-RUNE-PAGE-SERVICE]', data);
  }

  getPages(): Observable<RunePage[]> {
    return this.api.get('api/rune_pages').pipe(
      map((data) => {
        this.log('GetPages', data);
        if (data) {
          return (data as RunePage[]).map((obj) => {
            return new RunePage(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getPage(id: string): Observable<RunePage | null> {
    return this.api.get(`api/rune_pages/${id}`).pipe(
      map((data) => {
        this.log('GetPage', data);
        if (data) {
          return new RunePage(data);
        } else {
          return null;
        }
      })
    );
  }

  addPage(page: RunePage): Observable<Boolean> {
    return this.api.insert(`api/rune_pages`, page).pipe(
      map((data) => {
        this.log('AddPage', data);
        return !!data?.success;
      })
    );
  }

  updatePage(page: RunePage): Observable<Boolean> {
    return this.api.update(`api/rune_pages/${page.id}`, page).pipe(
      map((data) => {
        this.log('UpdatePage', data);
        return !!data;
      })
    );
  }

  deletePage(page: RunePage): Observable<boolean> {
    return this.api.delete(`api/rune_pages/${page.id}`).pipe(
      map((result) => {
        this.log('DeletePage', result);
        return !!result?.success;
      })
    );
  }
}
