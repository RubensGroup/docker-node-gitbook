### Acceder a la instancia
Siempre es necesario ingresar a la imagen para instalar alguna dependencia, componente, cambiar configuraciones, etc.
```sh
docker exec -ti ${PWD##*/} sh
```
#### Revisar el libro en el navegador
El puerto del anfitrio es el `7000`, por lo que podemos accceder al contenido del libro mediante el navegador
```http
http://localhot:70000
#o
http://0.0.0.0:70000
```

