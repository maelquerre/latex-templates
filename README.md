# LaTeX design templates

Here are my LaTeX design templates to make beautiful reports.

## Using the templates files (the way I use them)

1. Put the desired template file in the same directory as your source file.

2. Just write `\input{template_filename}` instead of the preamble in your source file.

3. Use LuaLaTex or **XeLaTex** (faster I guess) to compile your code since I use the `fontspec` package.

## Specifications

### Code blocks

You can insert a code block with the `mdframed` environment.

Each template file contains a set of colours and **commands** to highlight some code inside your code block.
I mostly use Python language so here are the commands for the syntax highlighting in Python (this is quite the same for all other languages, just choose the right highlight command):

- `\key{}`: keyword
- `\func{}`: function declaration
- `\param{}`: parameter
- `\built{}`: built-in function (`print()`or `input()`)
- `\op{}`: operator (`+`, `-`, etc.)
- `\ent{}`: number
- `\str{}`: string
- `\argm{}`: keyword argument
- `\com{}`: line comment
