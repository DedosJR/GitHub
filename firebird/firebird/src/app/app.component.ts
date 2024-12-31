import { Component, NgModule, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CarrosService } from './carros.service';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [ CommonModule, HttpClientModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [CarrosService],
})
export class AppComponent implements OnInit {
  carros: any[] = [];

  constructor(private carrosService: CarrosService,) {}

  ngOnInit(): void {
    this.carrosService.getPosts().subscribe((data: any[]) => {
      this.carros = data; // Asigna el array de datos
     //console.log(data);
    });
  }

}
document.addEventListener("DOMContentLoaded", () => {
  // Seleccionamos todos los elementos con la clase "categoria-a"
  const categorias: NodeListOf<HTMLElement> = document.querySelectorAll(".categoria-a");

  // Configuración del IntersectionObserver
  const observer = new IntersectionObserver((entries: IntersectionObserverEntry[], observer: IntersectionObserver) => {
      entries.forEach((entry: IntersectionObserverEntry) => {
          if (entry.isIntersecting) {
              const target = entry.target as HTMLElement;
              target.classList.add("visible"); // Agregamos la clase para activar el efecto
              observer.unobserve(target); // Dejamos de observar el elemento
          }
      });
  });

  // Observamos cada una de las categorías
  categorias.forEach((categoria: HTMLElement) => observer.observe(categoria));
});
