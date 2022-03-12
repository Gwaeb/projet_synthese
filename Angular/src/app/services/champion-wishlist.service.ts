import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { ChampionWishList } from '../models/champion-wishlist.model';
import { Champion } from '../models/champion.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root'
})
export class ChampionWishListService {

  constructor(private api: ApiRequestService) {

  }
  log(info:string, data: any) {
    console.log(`[API-CHAMPION-WISHLIST-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error("[API-SKIN-WISHLIST-SERVICE]", data);
  }

  getChampions(): Observable<ChampionWishList[]> {
    return this.api.get('api/champion_wishlists').pipe(
      map(data => {
        this.log('GetChampions', data);
        if (data) {
          return (data as ChampionWishList[]).map(obj => {
            return new ChampionWishList(obj);
          });
        } else {
          return [];
        }
      })
    )
  }
  addChampion(champion: Champion): Observable<Boolean> {
    return this.api.insert(`api/champion_wishlists/`, champion).pipe(
      map(data => {
        this.log('AddChampion', data);
        return !!data;
      })
    )
  }

  updateChampion(champion: Champion, oldChampionID: string): Observable<Boolean> {
    return this.api.update(`api/champion_wishlists/${champion.id}`, { oldID: oldChampionID}).pipe(
      map(data => {
        this.log('UpdateChampion', data);
        return !!data;
      })
    )
  }

  deleteChampion(champion: Champion): Observable<boolean> {
    return this.api.delete(`api/champion_wishlists/${champion.id}`).pipe(
      map(result => {
        this.log('DeleteChampion', result);
        return !!result;
      })
    );
  }


}
