## Libro nuevo gitbook
Es necesario estar posicionado en el directorio del proyecto al cual le queremos agregar documentación con _Gitbook_. El siguiente comando, creará el directorio **docs** que contendrá el Gitbook. 
> La referencia `${PWD##*/}` identifica el directorio actual desde el cual se está ejecutando el comando `gitbook init` que genera los archivos necesarios para iniciar a trabajar con el proyecto _Gitbook_.
```sh 
docker run -it --rm \
-v $(pwd):/docker-node-gitbook \
--name ${PWD##*/} rubensgroup/docker-node-gitbook:latest \
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
      "search",
      "forkmegithub"
    ],
    "pluginsConfig": {
        "forkmegithub": {
          "url": "https://github.com/RubensGroup/docker-node-gitbook.git",
          "color":"red"
        }
    },
    "theme-default": {
        "showLevel": true
    }
}
```
> **Instalar depedencias**: Todos las dependencias configuradas en el archivo `book.json`, se instalan con el siguiente comando.

```sh 
docker run -it --rm \
-v $(pwd):/docker-node-gitbook \
--name ${PWD##*/} rubensgroup/docker-node-gitbook:latest \
gitbook install docs
```