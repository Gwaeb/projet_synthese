import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { InsertResult } from '../models/insert-results.model';

@Injectable({
  providedIn: 'root'
})
export class ApiRequestService {
  constructor(private http: HttpClient) { }

  private getUrl(query: string) {
    return `/${query}/`;
  }
  log(info:string, data: any) {
    console.log(`[API-REQUEST-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error("[API-REQUEST-SERVICE]", data);
  }

  select(query: string, body: any = null): Observable<any[] | null> {
    return this.http.post(this.getUrl(query), body).pipe(
      map((response: any) => {
        this.log("Select",response);

        return response;
      }),
      catchError(error => {
        this.error(error);

        return of(null);
      })
    );
  }

  get(query: string, body: any = null): Observable<any[] | null> {
    return this.http.get(this.getUrl(query), {params: body}).pipe(
      map((response: any) => {
        this.log('Get', response);

        return response;
      }),
      catchError(error => {
        this.error(error);

        return of(null);
      })
    );
  }

  update(query: string, body: any = null): Observable<InsertResult | null> {
    return this.http.patch(this.getUrl(query), body).pipe(
      map(result => {
        this.log('Insert', result);

        return new InsertResult(result);
      }),
      catchError(error => {
        this.error(error);

        return of(null);
      })
    );
  }



  insert(query: string, body: any = null): Observable<InsertResult | null> {
    return this.http.post(this.getUrl(query), body).pipe(
      map(result => {
        this.log('Insert', result);

        return new InsertResult(result);
      }),
      catchError(error => {
        this.error(error);

        return of(null);
      })
    );
  }

  delete(query: string, body: any = null): Observable<InsertResult | null> {
    return this.http.delete(this.getUrl(query), {params: body}).pipe(
      map(result => {
        this.log('Delete', result);

        return new InsertResult(result);
      }),
      catchError(error => {
        this.error(error);

        return of(null);
      })
    );
  }

}
