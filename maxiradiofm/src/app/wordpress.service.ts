import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class WordpressService {
  private url = 'https://maxiradiofm.com/wp-json/wp/v2/posts';
  private categories = 'https://maxiradiofm.com/wp-json/wp/v2/categories';
  constructor(private http: HttpClient) {}
  getPosts(): Observable<any[]> {
    let params = new HttpParams().set('per_page', '1').set('_embed', '');
    return this.http.get<any[]>(this.url, { params });
  }
  //Últimos 4 post de la categoría de BC//
  getPostsd(categoryId = 2): Observable<any[]> {
    let params = new HttpParams()
      .set('categories', categoryId.toString())
      .set('per_page', '4')
      .set('_embed', '');
    return this.http.get<any[]>(this.url, { params });
  }
  //Para mostrar nombre de categorias
  getPostDeportes(categoryId: number): Observable<any> {
    const url = `${this.categories}/${categoryId}`;
    return this.http.get<any>(url);
  }
}
