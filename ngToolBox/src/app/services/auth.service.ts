import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.development';
import {Observable,catchError,throwError,tap} from 'rxjs';
import {Buffer} from 'buffer';
//http
import {HttpClient,HttpHeaders} from '@angular/common/http';
//models
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private url = environment.baseUrl;

  constructor(private http: HttpClient ) { }

  //generate credentials for logina
  generateBasicAuthCredentials(username: string, password:string):string {
    return Buffer.from(`${username}:${password}`).toString('base64');
  }

  login(username:string,password:string):Observable<User>{
    //make credentials
    const credentials = this.generateBasicAuthCredentials(username,password);
    //send credentials as authorization header specifying basic http authentication
    const httpOptions = {
      headers:new HttpHeaders({
        Authorization: `Basic ${credentials}`,
        'X-Requested-With':'XMLHttpRequest'
      }),
    };

    //create get request to authenticate
    return this.http.get<User>(this.url+'authenticate',httpOptions).pipe(
      tap((newUser)=>{
        //while credentials are stored in broswer localSTorage
        //we consider user to be logged in
        localStorage.setItem('credentials',credentials);
        return new User;
      }),
      catchError((err:any)=>{
        console.log(err);
        return throwError(
          ()=> new Error('AuthService.login(): error logging in user.')
        );
      })
    );
  }
}
