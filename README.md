# atom-refactoring-tools package

Refactoring tools for [Atom](http://atom.io).

Eventually, this package will contain a complete suite of refactoring tools, although I'm also writing it simply to figure out how to write an Atom plugin.

## Currently implemented refactorings

| Refactoring      | CoffeeScript | JavaScript | Ruby | ... |
|:-----------------|:-------------|:-----------|:-----|:----|
| [Extract Method] |              |            | ✓    |     |
| ...              |              |            |      |     |

[Extract Method]: http://refactoring.com/catalog/extractMethod.html

## To do

* [ ] Screenshot. Because it's an Atom package. :D
* [ ] Multiple language support
  * [ ] Deduce language from buffer
  * [ ] Allow other packages to provide refactorings for particular languages
* As many refactorings as possible
* Autodetection of duplication etc.?

## Contributing

Your pull requests are welcome! Just make sure they have sufficient tests.
