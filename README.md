# LaTeX templates

Here are my LaTeX templates to make beautiful documents (assignement, readme, etc.).

## Using the preamble files (the way I use them)

The preambles files are named according to the highlighting colours of the code in the `lstlisting` environments.

1. Put the desired preamble file in the same directory as your .tex source file.

2. Just write `\input{preamble_filename}` instead of the preamble in your source file (before `\begin{document}`).

3. Use LuaLaTex or **XeLaTex** to compile your document since the `fontspec` package is used.
