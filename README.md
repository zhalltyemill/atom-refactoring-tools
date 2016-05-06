# Zach's take on the [atom-refactoring-tools](https://github.com/marnen/atom-refactoring-tools) package by [marnen](https://github.com/marnen)

## Goals
The goal of this package is to implement the functionality of the [vim-refactoring-plugin](https://github.com/ecomba/vim-ruby-refactoring).

That includes(straight from the plugin page):
* :RAddParameter           - Add Parameter
* :RInlineTemp             - Inline Temp
* :RConvertPostConditional - Convert Post Conditional
* :RExtractConstant        - Extract Constant          (visual selection)
* :RExtractLet             - Extract to Let (Rspec)
* :RExtractLocalVariable   - Extract Local Variable    (visual selection)
* :RRenameLocalVariable    - Rename Local Variable     (visual selection/variable under the cursor, *REQUIRES matchit.vim*)
* :RRenameInstanceVariable - Rename Instance Variable  (visual selection, *REQUIRES matchit.vim*)
* :RExtractMethod          - Extract Method            (visual selection, *REQUIRES matchit.vim*)

It would be great if this would work in vim mode, but if it works well enough through the command panel then that could be enough.

Because of marnen's great work extract method is already implemented.

## TODO:
* The list above
* vim bindings
* additional refactorings (minitest, rails)

----------

# Original readme below

# atom-refactoring-tools package

Refactoring tools for [Atom](http://atom.io).

Eventually, this package will contain a complete suite of refactoring tools, although I'm also writing it simply to figure out how to write an Atom plugin.

## Currently implemented refactorings

| Refactoring      | CoffeeScript | JavaScript | Ruby | ... |
|:-----------------|:------------:|:----------:|:----:|:----|
| [Extract Method] |              |            |  ✓   |     |
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
