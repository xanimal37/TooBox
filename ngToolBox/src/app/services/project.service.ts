import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.development';
import {Observable,catchError,throwError,tap} from 'rxjs';
//http
import {HttpClient,HttpHeaders} from '@angular/common/http';
//models
import { Project } from '../models/project';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})

export class ProjectService {

private url = environment.baseUrl;

  constructor(
    private http: HttpClient,
    private auth: AuthService) { }

    getHttpOptions(){
      let options = {
        headers: {
          Authorization: 'Basic ' + this.auth.getCredentials(),
          'X-Requested-With': 'XMLHttpRequest'
        },
      };
      return options;
    }

    getProjects():Observable<Project[]> {
      return this.http.get<Project[]>(this.url, this.getHttpOptions()).pipe(
        catchError((err:any)=>{
         console.log(err);
         return throwError(
          ()=> new Error('ProjectService.getProjects(): error retrieving projects')
         );;
        })
      );
    }
}
