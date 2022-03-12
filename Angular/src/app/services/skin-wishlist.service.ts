import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { SkinWishList } from '../models/skin-wishlist.model';
import { Skin } from '../models/skin.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root'
})
export class SkinWishListService {

  constructor(private api: ApiRequestService) {

  }
  log(info:string, data: any) {
    console.log(`[API-SKIN-WISHLIST-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error("[API-SKIN-WISHLIST-SERVICE]", data);
  }

  getSkins(): Observable<SkinWishList[]> {
    return this.api.get('api/skin_wishlists').pipe(
      map(data => {
        this.log('GetSkins', data);
        if (data) {
          return (data as SkinWishList[]).map(obj => {
            return new SkinWishList(obj);
          });
        } else {
          return [];
        }
      })
    )
  }
  addSkin(skin: Skin): Observable<Boolean> {
    return this.api.insert(`api/skin_wishlists/`, skin).pipe(
      map(data => {
        this.log('AddSkin', data);
        return !!data;
      })
    )
  }

  updateSkin(skin: Skin, oldSkinID: string): Observable<Boolean> {
    return this.api.update(`api/skin_wishlists/${skin.id}`, { oldID: oldSkinID}).pipe(
      map(data => {
        this.log('UpdateSkin', data);
        return !!data;
      })
    )
  }

  deleteSkin(skin: Skin): Observable<boolean> {
    return this.api.delete(`api/skin_wishlists/${skin.id}`).pipe(
      map(result => {
        this.log('DeleteSkin', result);
        return !!result;
      })
    );
  }


}
