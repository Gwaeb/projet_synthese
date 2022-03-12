import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { InsertResult } from '../models/insert-results.model';
import { MatchHistory } from '../models/match_history.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root',
})
export class MatchService {
  constructor(private api: ApiRequestService) {}
  log(info: string, data: any) {
    console.log(`[API-MATCH-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error('[API-MATCH-SERVICE]', data);
  }

  getMatches(): Observable<MatchHistory[]> {
    return this.api.get('api/match_histories').pipe(
      map((data) => {
        this.log('GetMatchs', data);
        if (data) {
          return (data as MatchHistory[]).map((obj) => {
            return new MatchHistory(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getMatch(id: string): Observable<MatchHistory | null> {
    return this.api.get(`api/match_histories/${id}`).pipe(
      map((data) => {
        this.log('GetMatch', data);
        if (data) {
          return new MatchHistory(data);
        } else {
          return null;
        }
      })
    );
  }

  addMatch(match: MatchHistory): Observable<InsertResult | null> {
    return this.api.insert(`api/match_histories/`, match).pipe(
      map((data) => {
        this.log('AddMatch', data);
        return data;
      })
    );
  }

  updateMatch(match: MatchHistory): Observable<InsertResult | null> {
    return this.api.update(`api/match_histories/${match.id}`, match).pipe(
      map((data) => {
        this.log('UpdateMatch', data);
        return data;
      })
    );
  }

  deleteMatch(match: MatchHistory): Observable<boolean> {
    return this.api.delete(`api/match_histories/${match.id}`).pipe(
      map((result) => {
        this.log('DeleteMatch', result);
        return !!result;
      })
    );
  }
}
