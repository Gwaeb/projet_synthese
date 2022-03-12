import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { InsertResult } from '../models/insert-results.model';
import { Planning } from '../models/planning.model';
import { RapportChampionPosition } from '../models/rapport_champion_position.model';
import { RapportPlanning } from '../models/rapport_planning.model';
import { RapportRune } from '../models/rapport_rune.model';
import { User } from '../models/user.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root',
})
export class RapportsService {
  constructor(private api: ApiRequestService) {}
  log(info: string, data: any) {
    console.log(`[API-RAPPORTS-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error('[API-RAPPORTS-SERVICE]', data);
  }

  getRapportChampionPosition(): Observable<RapportChampionPosition | null> {
    return this.api.get(`api/rapports/1`).pipe(
      map((data) => {
        this.log('GetRapportChampionPosition', data);
        if (data) {
          return new RapportChampionPosition(data);
        } else {
          return null;
        }
      })
    );
  }

  getRapportRune(): Observable<RapportRune[] | null> {
    return this.api.get(`api/rapports/2`).pipe(
      map((data) => {
        this.log('GetRapportRune', data);
        if (data) {
          return (data as RapportRune[]).map((obj) => {
            return new RapportRune(obj);
          });
        } else {
          return null;
        }
      })
    );
  }

  getRapportPlanning(): Observable<RapportPlanning[] | null> {
    return this.api.get(`api/rapports/3`).pipe(
      map((data) => {
        this.log('GetRapportPlanning', data);
        if (data) {
          return (data as RapportPlanning[]).map((obj) => {
            return new RapportPlanning(obj);
          });
        } else {
          return null;
        }
      })
    );
  }
}
