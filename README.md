# LaTeX design templates

Here are my LaTeX templates to make beautiful reports.

## Using the preamble files (the way I use them)

The preamble files are named according to the highlighting colour of the code in the `lstlisting` environments.

1. Put the desired preamble file in the same directory as your source file ;

2. Just write `\input{preamble_filename}` instead of the preamble in your source file(before `\begin{document}`) ;

3. Use LuaLaTex or **XeLaTex** (faster I guess) to compile your code since I use the `fontspec` package.

