## Compilar un libro para producción 
## 
::: *Nota:* ::: Antes de poder generar un libro compilado, es necesario antes haber hecho el `gitbook install`

Primero es necesario generar el compilado del Gitbook `gitbook build`
```sh
docker run -it --rm \
-v $(pwd):/docker-node-gitbook \
--name ${PWD##*/} rubensgroup/docker-node-gitbook:latest \
gitbook build docs
```

Generar la imagen localmente con Nginx, para servir el Gitbook
> Nota: Es necesario crear una copia del archivo `Dockerfile.prod` en el directorio que se creo para trabajar en el GitBook

```sh 
docker build  -t docker-node-gitbook-prod  -f Dockerfile.prod .
```

#### Revisar el compilado final en local
Para revisar en local el resultado de la compilación, es neceario levantar la instancia de Docker en el puerto `80`
```sh
docker run -it --rm \
-p 7000:80 \
--name ${PWD##*/} rubensgroup/docker-node-gitbook:latest:latest
```

#### Revisar el libro en el navegador
El puerto del anfitrio es el `7000`, por lo que podemos accceder al contenido del libro mediante el navegador
```http
http://localhot:7000
#o
http://0.0.0.0:7000
```

