## Code

Inline `code`

Indented code

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code


Block code "fences"

```
Sample text here...
```

Syntax highlighting `js`

``` js
var foo = function (bar) {
  return bar++;
};

console.log(foo(5));
```
Syntax highlighting `Python`
```python
from urllib.request import urlopen
from urllib.error import HTTPError
from bs4 import BeautifulSoup
 
try:
    html = urlopen("https://www.python.org/")
except HTTPError as e:
    print(e)
else:
    res = BeautifulSoup(html.read(),"html5lib")
    print(res.title)
```