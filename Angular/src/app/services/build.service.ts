import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { Build } from '../models/build.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root',
})
export class BuildService {
  constructor(private api: ApiRequestService) {}
  log(info: string, data: any) {
    console.log(`[API-BUILD-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error('[API-BUILD-SERVICE]', data);
  }

  getBuilds(): Observable<Build[]> {
    return this.api.get('api/builds').pipe(
      map((data) => {
        this.log('GetBuilds', data);
        if (data) {
          return (data as Build[]).map((obj) => {
            return new Build(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getBuild(id: string): Observable<Build | null> {
    return this.api.get(`api/builds/${id}`).pipe(
      map((data) => {
        this.log('GetBuild', data);
        if (data) {
          return new Build(data);
        } else {
          return null;
        }
      })
    );
  }

  addBuild(build: Build): Observable<Boolean> {
    return this.api.insert(`api/builds`, build).pipe(
      map((data) => {
        this.log('AddBuild', data);
        return !!data?.data;
      })
    );
  }

  updateBuild(build: Build): Observable<Boolean> {
    return this.api.update(`api/builds/${build.id}`, build).pipe(
      map((data) => {
        this.log('UpdateBuild', data);
        return !!data;
      })
    );
  }

  deleteBuild(build: Build): Observable<boolean> {
    return this.api.delete(`api/builds/${build.id}`).pipe(
      map((result) => {
        this.log('DeleteBuild', result);
        return !!result?.success;
      })
    );
  }
}
