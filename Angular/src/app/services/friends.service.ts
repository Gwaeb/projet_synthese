import { Injectable } from '@angular/core';
import { ApiRequestService } from './api-request.service';
import { Friend } from '../models/friend.model';
import { map, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class FriendsService {
  constructor(private api: ApiRequestService) {}

  log(info: string, data: any) {
    console.log(`[API-FRIENDS-SERVICE] ${info}`, data);
  }

  getFriends(): Observable<Friend[]> {
    return this.api.get('api/friends').pipe(
      map((data) => {
        this.log('GetFriends', data);
        if (data) {
          return (data as Friend[]).map((obj) => {
            return new Friend(obj);
          });
        } else {
          return [];
        }
      })
    );
  }
}
