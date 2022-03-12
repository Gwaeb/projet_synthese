import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { InsertResult } from '../models/insert-results.model';
import { Planning } from '../models/planning.model';
import { User } from '../models/user.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root'
})
export class PlanningService {

  constructor(private api: ApiRequestService) {

  }
  log(info:string, data: any) {
    console.log(`[API-PLANNING-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error("[API-PLANNING-SERVICE]", data);
  }

  getPlanning(id: string | null): Observable<Planning | null> {
    return this.api.get(`api/plannings/${id}`).pipe(
      map(data => {
        this.log('GetPlanning', data);
        if (data) {
          return new Planning(data);
        } else {
          return null;
        }
      })
    )
  }
  getPlannings(): Observable<Planning[]> {
    return this.api.get('api/plannings').pipe(
      map(data => {
        this.log('GetPlannings', data);
        if (data) {
          return (data as Planning[]).map(obj => {
            return new Planning(obj);
          });
        } else {
          return [];
        }
      })
    )
  }

  getPendingPlannings(): Observable<Planning[]> {
    return this.api.get('api/pending/plannings').pipe(
      map(data => {
        this.log('GetPlanningsPending', data);
        if (data) {
          return (data as Planning[]).map(obj => {
            return new Planning(obj);
          });
        } else {
          return [];
        }
      })
    )
  }

  acceptPlanning(id: string): Observable<InsertResult | null> {
    return this.api.insert(`api/pending/plannings/${id}/accept`).pipe(
      map(data => {
        this.log('AcceptPlanning', data);
        return data;
      })
    )
  }

  denyPlanning(id: string): Observable<InsertResult | null> {
    return this.api.insert(`api/pending/plannings/${id}/deny`).pipe(
      map(data => {
        this.log('DenyPlanning', data);
        return data;
      })
    )
  }

  addPlanning(planning: Planning): Observable<InsertResult | null> {
    return this.api.insert(`api/plannings/`, planning).pipe(
      map(data => {
        this.log('AddPlanning', data);
        return data;
      })
    )
  }
  updatePlanning(planning: Planning): Observable<InsertResult | null> {
    return this.api.update(`api/plannings/${planning.id}`, planning).pipe(
      map(data => {
        this.log('UpdatePlanning', data);
        return data;
      })
    )
  }

  deletePlanning(planning: Planning): Observable<boolean> {
    return this.api.delete(`api/plannings/${planning.id}`).pipe(
      map(result => {
        this.log('DeletePlanning', result);
        return !!result;
      })
    );
  }


}
