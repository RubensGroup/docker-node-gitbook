# Gitbook 
[Gitbook](https://github.com/GitbookIO/gitbook) es una herramienta para documentar proyectos de manera fácil, usando solamente archivos `.md`, ofrece la posibilida de configurar y customizar los [Themas](https://www.npmjs.com/package/gitbook-plugin-theme-gestalt), la igual que permite levantar un servidor local para edición. 
- [Documentación oficial](https://docs.gitbook.com/)
- [Configuraciones especiales](https://gitbookio.gitbooks.io/documentation/content/format/index.html)

### Creación de imagen Docker
Entrar en la carpeta `docker-node-gitbook`, para generar la imagen Docker localmente
```sh 
docker build  -t docker-node-gitbook  .
```
## Libro nuevo gitbook
Es necesario estar posicionado en el directorio del proyecto al cual le queremos agregar documentación con _Gitbook_. El siguiente comando, creará el directorio **docs** que contendrá el Gitbook. 
> La referencia `${PWD##*/}` identifica el directorio actual desde el cual se está ejecutando el comando `gitbook init` que genera los archivos necesarios para iniciar a trabajar con el proyecto _Gitbook_.
```sh 
docker run -it --rm \
-v $(pwd):/docker-node-gitbook \
--name ${PWD##*/} docker-node-gitbook:latest \
gitbook init docs
```
> **Configuración de dependecias**: Con el comando anterior se creó la carpeta `docs`con el libro, para instalar las dependecias tenemos que crear el archivo `book.json` en la carpeta **docs** con el siguiente contenido:

```json
{
    "title": "GitBook",
    "description": "Test Book GitBook",
    "author": "3rm",
    "plugins": [
      "lunr",
      "fontsettings",
      "highlight",
      "livereload",
      "-sharing",
      "back-to-top-button",
      "search"
    ],
    "theme-default": {
        "showLevel": true
    },
    "links": {        
        "sidebar": {
            "Repositorio Oficial": "https://customlink.com"
        }
    }
  }

```
> **Instalar depedencias**: Todos las dependencias configuradas en el archivo `book.json`, se instalan de la siguiente manera.

```sh 
docker run -it --rm \
-v $(pwd):/docker-node-gitbook \
--name ${PWD##*/} docker-node-gitbook:latest \
gitbook install docs
```

## Libro existente
Siempre se debe estar parado sobre el directorio que contiene libro `el directorio padre de la carpeta **docs**` para poder levantar el servidor local de Gitbook con `gitbook serve docs`.
```sh 
docker run -it --rm \
-p 7000:4000 \
-v $(pwd):/docker-node-gitbook \
--name ${PWD##*/} docker-node-gitbook:latest \
gitbook serve docs
```

## Compilar un libro para producción 
Primero es necesario generar el compilado del Gitbook `gitbook build`
```sh
docker run -it --rm \
-v $(pwd):/docker-node-gitbook \
--name ${PWD##*/} docker-node-gitbook:latest \
gitbook build docs
```

Generar la imagen localmente con Nginx, para servir el Gitbook
> Nota: Es necesario crear una copia del archivo `Dockerfile.prod` en el directorio que se creo para trabajar en el GitBook

```sh 
docker build  -t docker-node-gitbook-prod  -f Dockerfile.prod .
```

```sh
docker run -it --rm \
-p 7000:80 \
--name ${PWD##*/} docker-node-gitbook-prod:latest
```
---

##### Acceder a la instancia
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

