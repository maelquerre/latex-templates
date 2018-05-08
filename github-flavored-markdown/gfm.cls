% !TEX encoding = UTF-8 Unicode

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gfm}


% ----------
% Base class
% ----------
\LoadClassWithOptions{article}


% --------------
% External packages
% --------------
% Needed for XeLaTeX fonts usage
\RequirePackage{fontspec}
% Margin definition:
\RequirePackage[margin=2cm]{geometry}
% Required for links
\RequirePackage{hyperref, url}
% Required for listings
\RequirePackage{listings}
% Required to manage colours [within tables]
\RequirePackage[table]{xcolor}
% Required for mdframed frames
\RequirePackage[framemethod=TikZ]{mdframed}
% Required for scratched text
\RequirePackage[normalem]{ulem}
% Required for sections customisation
\RequirePackage{titlesec}


% ------------------
% Fonts declarations
% ------------------

% Main font
\setmainfont{SF-Pro-Text}[
  Path=fonts/,
  UprightFont=*-Regular,
  BoldFont=*-Semibold,
  ItalicFont=*-RegularItalic,
  BoldItalicFont=*-SemiboldItalic]

% Mono font
\setmonofont{SFMono}[
  Path=fonts/,
  UprightFont=*-Regular,
  BoldFont=*-Bold,
  ItalicFont=*-RegularItalic,
  BoldItalicFont=*-BoldItalic,
  Scale=0.9]

% Setting heading font for sections and subsections
\newfontfamily\headingfont{SF-Pro-Display}[
  Path=fonts/,
  UprightFont=*-Regular,
  BoldFont=*-Semibold,
  ItalicFont=*-RegularItalic,
  BoldItalicFont=*-SemiboldItalic]


% ---------------------
% Colours configuration
% ---------------------
\definecolor{ultralightslate}{HTML}{F6F8FA}
\definecolor{ultralightgray}{HTML}{F3F4F4}
\definecolor{verylightgray}{HTML}{EAECEF}
\definecolor{lightgray}{HTML}{DFE2E5}
\definecolor{gray}{HTML}{6A737D}

\definecolor{blue}{HTML}{005CC5}
\definecolor{dark-blue}{HTML}{032F62}
\definecolor{orange}{HTML}{FF6209}
\definecolor{purple}{HTML}{6F42C1}
\definecolor{red}{HTML}{D73A49}

\colorlet{code-block}{ultralightslate}
\colorlet{inline-code}{ultralightgray}
\colorlet{line}{lightgray}
\colorlet{rule}{verylightgray}

% -------------------
% Document formatting
% -------------------

% No section numbering (numbering depth of zero)
% ----------------------------------------------
\setcounter{secnumdepth}{0}

% No indent by default
% --------------------
\newlength\tindent
\setlength{\tindent}{\parindent}
\setlength{\parindent}{0pt}
\renewcommand{\indent}{\hspace*{2.5em}}

% Line spacing
% ------------
\renewcommand{\baselinestretch}{1.3}


% -------------------
% Table configuration
% -------------------
\rowcolors{2}{ultralightslate}{white}  % Alternate row colours
\arrayrulecolor{line} % Array rule colour
\setlength\arrayrulewidth{1\p@} % Rule width
\renewcommand{\arraystretch}{1.5}  % Cell vertical spacing
\setlength{\tabcolsep}{0.5cm}  % Cell horizontal spacing


% ----------------------
% Mdframed configuration
% ----------------------
\mdfsetup{
  leftmargin=0,
  rightmargin=0,
  innertopmargin=5pt,
  innerrightmargin=10pt,
  innerbottommargin=5pt,
  innerleftmargin=10pt
}


% ----------------------------
% Code inclusion configuration
% ----------------------------

% Code snippets
% -------------
\newcommand\code[2][fill=inline-code]{%
  \tikz[baseline]%
  \node[inner ysep=1pt, inner xsep=2.5pt, anchor=text, rectangle, rounded corners=2pt, #1]{
    \strut\texttt{\lstinline{#2}}
  };
}

% General configuration
% ---------------------
\lstset {
    frame=none, % No frame around listing
    backgroundcolor=\color{code-block},
    basicstyle=\linespread{1.1}\ttfamily, % Line spread of 1.1 between lines and ttfamily font
    upquote=true, % Straight single quotes
    columns=flexible, % Flexible column alignment
    breaklines=true, % Line breaks
    tabsize=4, % 4 spaces per tab
    keepspaces=true, % Not drop spaces to fix column alignment and always convert tabulators to spaces
    %
    % Style:
    commentstyle=\color{gray},
    stringstyle=\color{dark-blue},
    showstringspaces=false, % Don't put marks in string spaces
    %
    keywordstyle=[1]\color{red}, % Keywords style
    keywordstyle=[2]\color{blue}, % Built-in functions style
    keywordstyle=[3]\color{purple}, % Other methods style
    %
    % Colours for numbers:
    % (The star indicates that literate replacements should not be made in strings, comments, and other delimited text)
    literate=*{0}{{{\color{blue}0}}}{1}
              {1}{{{\color{blue}1}}}{1}
              {2}{{{\color{blue}2}}}{1}
              {3}{{{\color{blue}3}}}{1}
              {4}{{{\color{blue}4}}}{1}
              {5}{{{\color{blue}5}}}{1}
              {6}{{{\color{blue}6}}}{1}
              {7}{{{\color{blue}7}}}{1}
              {8}{{{\color{blue}8}}}{1}
              {9}{{{\color{blue}9}}}{1}
              {.}{{{\color{red}.}}}{1}
}

% Java configuration
% ------------------
\lstdefinelanguage{Java} {
    % Standard keywords:
    keywords={abstract, assert, boolean, break, byte, case, catch, char, class, const,
              continue, default, do, double, else, enum, extends, final, finally, float,
              for, goto, if, implements, import, instanceof, int, interface, long, native,
              new, package, private, protected, public, return, short, static, strictfp,
              String, super, switch, synchronized, throw, throws, transient, try, void,
              volatile, while},
    % Built-in functions:
    morekeywords=[2]{false, null, this, true},
    %
    morecomment=[s]{/*}{*/},
    morecomment=[l]{//},
    %
    morestring=[b]', % Strings defined with "
    morestring=[b]", % Strings defined with '
    % Operators:
    % (The colour of otherkeywords is the same colour as keywordstyle[1])
    otherkeywords={+, -, =, <, >, \%, +=, -=, *=}, % unable to set * and / as operators with comments (// and /**/)
}

% Javascript configuration
% ------------------------
\lstdefinelanguage{JavaScript} {
    % Standard keywords:
    keywords={break, do, instanceof, typeof, case, else, new, var, catch, finally,
              return, void, continue, for, switch, while, debugger, function,
              with, default, if, throw, delete, in, try},
    % Built-in functions:
    morekeywords=[2]{append, false, find, log, null, prepend, this, true},
    % Other methods:
    morekeywords=[3]{alert, attr, console, css, each, hide, html, off, on, show, text, val},
    %
    morecomment=[s]{/*}{*/},
    morecomment=[l]{//},
    %
    morestring=[b]', % Strings defined with "
    morestring=[b]", % Strings defined with '
    % Operators:
    % (The colour of otherkeywords is the same colour as keywordstyle[1])
    otherkeywords={+, -, =, <, >, \%, +=, -=, *=}, % unable to set * and / as operators with comments (// and /**/)
}

% Markdown configuration
% ----------------------
\lstdefinelanguage{Markdown} {
% Redefine black color for numbers and dot
literate=*{0}{{{\color{black}0}}}{1}
          {1}{{{\color{black}1}}}{1}
          {2}{{{\color{black}2}}}{1}
          {3}{{{\color{black}3}}}{1}
          {4}{{{\color{black}4}}}{1}
          {5}{{{\color{black}5}}}{1}
          {6}{{{\color{black}6}}}{1}
          {7}{{{\color{black}7}}}{1}
          {8}{{{\color{black}8}}}{1}
          {9}{{{\color{black}9}}}{1}
          {.}{{{\color{black}.}}}{1}
}

% Python configuration
% --------------------
% Set the delimiter for classes declarations ('class TheClass:')
\newcommand{\pythonClassHighlight}[1]{\textcolor{red}{class} \textcolor{purple}{#1}:}
% Set the delimiter for functions declarations ('def function()')
\newcommand{\functionDefHighlight}[1]{\textcolor{red}{def} \textcolor{purple}{#1}(}
% Set the delimiter for special methods declarations ('def __init__()')
\newcommand{\specialMethodHighlight}[1]{\textcolor{red}{def} \textcolor{blue}{\_\_#1\_\_}}
\lstdefinelanguage{Python} {
	% Standard keywords:
    morekeywords=[1]{and, as, assert, break, class, continue, def, del, elif, else, except,
    				 finally, for, from, global, if, import, in, is, lambda, nonlocal, not,
				 	 or, pass, raise, return, try, while, with, yield},
    %
    % Built-in functions:
    morekeywords=[2]{abs, all, any, ascii, bin, bool, bytearray, bytes, callable, chr,
    				 classmethod, compile, complex, delattr, dict, dir, divmod, enumerate,
				 	 eval, exec, False, filter, float, format, frozenset, getattr, globals,
					 hasattr, hash, help, hex, id, input, int, isinstance, issubclass,
					 iter, len, list, locals, map, max, memoryview, min, next, None,
					 object, oct, open, ord, pow, print, property, range, repr, reversed,
					 round, self, set, setattr, slice, sorted, staticmethod, str, sum,
					 super, True, tuple, type, vars, zip},
    %
    % Operators:
    % (The colour of otherkeywords is the same colour as keywordstyle[1])
    otherkeywords={+, -, *, /, =, <, >, \%, +=, -=, *=},
    %
    morecomment=[l][\color{gray}]{\#}, % Python comments (#)
    %
    morestring=[b]", % Strings defined with "
    morestring=[b]', % Strings defined with '
    %
    % Functions highlighting:
    moredelim=[is][\pythonClassHighlight]{class\ }{:}, % Delimiter for classes declarations
	moredelim=[is][\functionDefHighlight]{def\ }{(}, % Delimiter for functions declarations
	moredelim=[is][\specialMethodHighlight]{def\ __}{__}, % Delimiter for special methods declarations
	moredelim=[s][\color{blue}]{__}{__}, % Delimiter for special methods
}

% ----------------------------------
% Surround lstlistings with mdframed
% ----------------------------------
\surroundwithmdframed[
  hidealllines=true, % hide mdframed lines
  font=\ttfamily,
  backgroundcolor=code-block,
  roundcorner=3pt]{lstlisting}
  
% Creates a new command to include a Python listing:
% The first parameter is the filename of the script (without .py) and the second parameter is the caption
\newcommand{\pythonlisting}[2]{
\begin{itemize}
\item[]\lstinputlisting[language=Python, caption=#2, label=#1]{#1.py}
\end{itemize}
}

% Creates a new command to include a Java listing:
% The first parameter is the filename of the script (without .java) and the second parameter is the caption
\newcommand{\javalisting}[2]{
\begin{itemize}
\item[]\lstinputlisting[language=Java, caption=#2, label=#1]{#1.py}
\end{itemize}
}

\newenvironment{blockquote}[1][]{
  \noindent
  \begin{mdframed}[
    linewidth=2pt,
    linecolor=line,
    topline=false, rightline=false, bottomline=false,
    skipabove=1pt, skipbelow=1pt,
    innertopmargin=0pt, innerrightmargin=0pt, innerbottommargin=0pt,
    innerleftmargin=1em,  % Distance between vertical rule and blockquote content
    skipabove=.5\baselineskip]
  \color{gray}
  %\par\medskip
}
{
  \end{mdframed}
}

% Title formats configuration
% ---------------------------
\titleformat{\section}{\huge\bfseries\headingfont}{\thesection}{1em}{}[{\color{rule}\titlerule[1pt]}]  % horizontal rule under sections
\titleformat{\subsection}{\LARGE\bfseries\headingfont}{\thesubsection}{1em}{}[{\color{rule}\titlerule[1pt]}]  % horizontal rule under subsections
\titleformat{\subsubsection}{\Large\bfseries\headingfont}{\thesubsection}{1em}{}[{\color{rule}}]
\titleformat*{\paragraph}{\large\bfseries\headingfont}
