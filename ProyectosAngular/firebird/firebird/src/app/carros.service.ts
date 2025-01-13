import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable,throwError, ObservableInput } from 'rxjs';
import { map,catchError} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class CarrosService {
  private api='http://localhost:1337/api';

  constructor(private http: HttpClient) { }

  // Modificado para devolver solo el arreglo "data"
  getPosts(): Observable<any[]> {
    return this.http.get<any>(`${this.api}/posts?populate=*`).pipe(
      map(response => response.data.slice(0,4))  // Extraemos la propiedad "data"
    );
    //return this.http.get<any>(`${this.api}/posts?populate=*&limit=10`).pipe(
  }
}

