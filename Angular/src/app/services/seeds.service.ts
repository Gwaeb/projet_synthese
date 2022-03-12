import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { Category } from '../models/category.model';
import { Champion } from '../models/champion.model';
import { Item } from '../models/item.model';
import { Rune } from '../models/rune.model';
import { Skin } from '../models/skin.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root',
})
export class SeedsService {
  constructor(private api: ApiRequestService) {}
  log(info: string, data: any) {
    console.log(`[API-SEED-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error('[API-SEED-SERVICE]', data);
  }

  getItems(): Observable<Item[]> {
    return this.api.get('api/items').pipe(
      map((data) => {
        this.log('GetItems', data);
        if (data) {
          return (data as Item[]).map((obj) => {
            return new Item(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getChampions(): Observable<Champion[]> {
    return this.api.get(`api/champions`).pipe(
      map((data) => {
        this.log('GetChampions', data);
        if (data) {
          return (data as Champion[]).map((obj) => {
            return new Champion(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getSkins(): Observable<Skin[]> {
    return this.api.get('api/skins').pipe(
      map((data) => {
        this.log('GetSkins', data);
        if (data) {
          return (data as Skin[]).map((obj) => {
            return new Skin(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getSkinsByChampion(champion: Champion): Observable<Skin[]> {
    return this.api.get(`api/champions/${champion.id}/skins`).pipe(
      map((data) => {
        this.log('GetSkinsByChampion', data);
        if (data) {
          return (data as Skin[]).map((obj) => {
            return new Skin(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getCategories(): Observable<Category[]> {
    return this.api.get('api/categories').pipe(
      map((data) => {
        this.log('GetCategories', data);
        if (data) {
          return (data as Category[]).map((obj) => {
            return new Category(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getRunes(): Observable<Rune[]> {
    return this.api.get('api/runes').pipe(
      map((data) => {
        this.log('GetRunes', data);
        if (data) {
          return (data as Rune[]).map((obj) => {
            return new Rune(obj);
          });
        } else {
          return [];
        }
      })
    );
  }

  getRunesByCategory(category: Category): Observable<Rune[]> {
    return this.api.get(`api/categories/${category.id}/runes`).pipe(
      map((data) => {
        this.log('GetRunesByCategory', data);
        if (data) {
          return (data as Rune[]).map((obj) => {
            return new Rune(obj);
          });
        } else {
          return [];
        }
      })
    );
  }
}
