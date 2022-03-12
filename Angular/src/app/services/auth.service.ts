import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { InsertResult } from '../models/insert-results.model';
import { UserCredentials } from '../models/user-credentials.model';
import { User } from '../models/user.model';
import { ApiRequestService } from './api-request.service';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private _currentUser: User | null = null;

  get currentUser(): User | null {
    return this._currentUser;
  }

  get isLoggedIn(): boolean {
    return !!this._currentUser;
  }

  constructor(private api: ApiRequestService) {}

  setCurrentUser(user: User) {
    this._currentUser = user;
  }

  log(info:string, data: any) {
    console.log(`[API-AUTH-SERVICE] ${info}`, data);
  }
  error(data: any) {
    console.error("[API-AUTH-SERVICE]", data);
  }

  logIn(credentials: UserCredentials): Observable<InsertResult | null> {
    return this.api.insert('users/sign_in', { user: credentials }).pipe(
      map((data) => {
        this.log('LogIn', data);
        if (data?.success) {
          this.setCurrentUser(new User(data?.data));

        }
        return data;
      })
    );
  }

  signUp(credentials: UserCredentials): Observable<InsertResult | null> {
    return this.api.insert('users', { user: credentials }).pipe(
      map((data) => {
        this.log('SignUp', data);
        if (data?.success) {
          this.setCurrentUser(new User(data?.data));
        }
        return data;
      })
    );
  }

  signOut(): Observable<boolean> {
    return this.api.delete('users/sign_out').pipe(
      map((data) => {
        this.log('SignOut', data);
        if (data?.success) return true;
        else return false;
      })
    );
  }

  getCurrentUser(): Observable<User | null> {
    return this.api.get('api/user').pipe(
      map((data) => {
        this.log('GetCurrentUser', data);
        if (data) {
          this.setCurrentUser(new User(data));
          return <User>this.currentUser;
        } else return null;
      })
    );
  }

  getUserById(id: any): Observable<User | null> {
    return this.api.get(`api/user/${id}`).pipe(
      map((data) => {
        this.log('GetUserById', data);
        if (!!data) {
          try {
            return new User(data);
          } catch(e: any) {
            return null;
          }
        } else return null;
      })
    );
  }
}
