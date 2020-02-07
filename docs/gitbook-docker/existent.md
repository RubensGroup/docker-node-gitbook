## Libro existente

Siempre se debe estar parado sobre el directorio que contiene libro `el directorio padre de la carpeta **docs**` para poder levantar el servidor local de Gitbook con `gitbook serve docs`.
```sh 
docker run -it --rm \
-p 7000:4000 \
-v $(pwd):/docker-node-gitbook \
--name ${PWD##*/} rubensgroup/docker-node-gitbook:latest \
gitbook serve docs
```

#### Revisar el libro en el navegador
El puerto del anfitrio es el `7000`, por lo que podemos accceder al contenido del libro mediante el navegador
```http
http://localhot:7000
#o
http://0.0.0.0:7000
```


