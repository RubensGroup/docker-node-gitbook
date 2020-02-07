### Troubleshooting
Al momento de trabajar con Gitbook me encontré con 2 grandes problemas que fueron difíciles de detectar en la documentación "Creo que era obvios", para mi no lo fueron, y escribí esta sección para tratar de ayudar por si tienes el mismo problema.

#### Problema 1
Cuando se usa lenguaje o sintaxis que en inteprete de Markdown no logra compilar, como el siguiente:

** Código no compilable como Markdown **

```
---
__ Advertisement :) __
---
```
Error de respuesta al intentar levantar el servidor `gitbook serve` o  `gitbook serve docs`

```
error: error while generating page "README.md": 

Template render error: (/docker-node-gitbook/node_modules/gitbook-plugin-search/_layouts/website/page.html)
  Template render error: (/root/.gitbook/versions/3.2.3/node_modules/gitbook-plugin-theme-default/_layouts/website/summary.html) [Line 4, Column 46]
  TypeError: attributes.toJS is not a function
```
> ::: La solución ::: es borrar el contenido no compilable

#### Problema 2
El archivo SUMMARY.md está preparado solamente para recibir LINKS, cuando se usa algo diferente la compilación se puede romper y ser dificil de encontrar.
Este es un ejemplo de formato:
```
##     
## Docker to build a Gitbook
* [Gitbook in Docker](gitbook-docker/readme.md)
    * [Gitbook New](gitbook-docker/new.md)
```