% !TEX encoding = UTF-8 Unicode
% !TEX TS-program = XeLaTeX --shell-escape

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modern}

% ----------
% Base class
% ----------
\LoadClassWithOptions{article}


% -----------------
% External packages
% -----------------
% Custom headers and footers
\RequirePackage{fancyhdr}
% Put figures where you actually want
\RequirePackage{float}
% Required for XeLaTeX fonts usage
\RequirePackage{fontspec}
% Margins definition
\RequirePackage[margin=2.5cm]{geometry}
% Required for graphics inclusions
\RequirePackage{graphicx}
% Required for links
\RequirePackage{hyperref, url}
% Required to get the last page number
\RequirePackage{lastpage}
% Required for insertion of code
\RequirePackage{listings}
% Required for mdframed frames
\RequirePackage[framemethod=TikZ]{mdframed}
% Text Com­pan­ion fonts, which pro­vide many text sym­bols
\RequirePackage{textcomp}
% Required for color definitions
\RequirePackage{xcolor}
% Needed for \if-\then-\else statement
\RequirePackage{xifthen}
% Required for coloured frames
\RequirePackage{tikz}
% Required for sections customisation
\RequirePackage{titlesec}

% ------------------
% Fonts declarations
% ------------------

% Main font
\setmainfont{SF-Pro-Text}[
  Path=fonts/,
  UprightFont=*-Regular,
  BoldFont=*-Medium,
  ItalicFont=*-LightItalic,
  BoldItalicFont=*-MediumItalic]

% Mono font
\setmonofont{SFMono}[
  Path=fonts/,
  UprightFont=*-Regular,
  BoldFont=*-Bold,
  ItalicFont=*-RegularItalic,
  BoldItalicFont=*-BoldItalic,
  Scale=0.9]

% Heading font
\newfontfamily\headingfont{SF-Pro-Display}[
  Path=fonts/,
  UprightFont=*-Regular,
  BoldFont=*-SemiBold,
  ItalicFont=*-RegularItalic,
  BoldItalicFont=*-SemiboldItalic]


% ----------------------
% Commands for meta data
% ----------------------
% Institute
\newcommand{\institute}[1]{\def\@institute{#1}}
% Department
\newcommand{\department}[1]{\def\@department{#1}}
% Subject
\newcommand{\subject}[1]{\def\@subject{#1}}


% ------------------
% Document structure
% ------------------

% Title formats configuration
% ---------------------------
\titleformat{\section}{\LARGE\bfseries\headingfont}{\thesection}{1em}{}
\titleformat{\subsection}{\Large\bfseries\headingfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\large\bfseries\headingfont}{\thesubsubsection}{1em}{}
%\titleformat*{\paragraph}{\large\bfseries\headingfont}

% Header
% ------
\newcommand{\makeheader}{%
  \noindent%
  \ifthenelse{\isundefined{\@institute}}{}{\@institute}
  \ifthenelse{\isundefined{\@date}}{}{\hfill\@date\\}
  \ifthenelse{\isundefined{\@department}}{}{%
    \begin{tabular}{@{}l}%
      \@department%
    \end{tabular}\hfill%
  }%
  \ifthenelse{\isundefined{\@author}}{}{%
    \begin{tabular}{r@{}}%
      \@author%
    \end{tabular}%
  }%
  \vspace{1em}

  \ifthenelse{\isundefined{\@subject}}{}{%
    \begin{center}%
      {\Large\headingfont{\@subject}}%
    \end{center}%
  }
  \begin{center}%
    {\huge\bfseries\headingfont{\@title}}%
  \end{center}%
  \vspace{1em}
}

% Fancyhdr (headers and footers)
% ------------------------------
\pagestyle{fancy}
\cfoot{\thepage~/ \pageref{LastPage}} % style de numéro de page
\fancypagestyle{plain}{%
\fancyhf{} % vide l’en-tête et le pied~de~page.
\fancyfoot[C]{\thepage~/ \pageref{LastPage}} % style de numéro de page
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}

% Line spacing
% ------------
\renewcommand{\baselinestretch}{1.3}


% ---------------------
% Colours configuration
% ---------------------
\definecolor{black}{RGB}{0,0,0}
\definecolor{gray}{RGB}{106,115,125}
\definecolor{arrayrulegray}{RGB}{223,226,229}
\definecolor{codeblockline}{RGB}{230,230,230}
\definecolor{rulegray}{RGB}{234,236,239}
\definecolor{codegray}{RGB}{243,244,244}
\definecolor{codeblockbackground}{RGB}{249,250,250}
\definecolor{blue}{RGB}{0,92,197}
\definecolor{dark-blue}{RGB}{3,47,98}
\definecolor{orange}{RGB}{227,98,9}
\definecolor{purple}{RGB}{111,66,193}
\definecolor{red}{RGB}{215,58,73}


% ----------------------
% Mdframed configuration
% ----------------------
\mdfsetup{
  leftmargin=0,
  rightmargin=0,
  innertopmargin=5pt,
  innerrightmargin=10pt,
  innerbottommargin=0,
  innerleftmargin=10pt,
  linecolor=codeblockline,
  font=\ttfamily,
  backgroundcolor=codeblockbackground,
  roundcorner=3pt
}


% ----------------------------
% Code inclusion configuration
% ----------------------------

% Code snippets
% -------------
\newcommand\code[2][fill=codegray]{%
  \tikz[baseline]%
  \node[
    draw, rectangle, gray,
    inner ysep=1pt, inner xsep=2.5pt,
    anchor=text, rounded corners=2pt, #1]{%
    \strut\texttt{\textcolor{black}{\lstinline{#2}}}%
  };%
}

% General configuration
% ---------------------
\lstset {
    frame=none, % No frame around listing
    backgroundcolor=\color{codeblockbackground},
    framexleftmargin=5pt,  % Margin between the code and the frameline
	xleftmargin=25pt, % Margin between the left border of the page and the listing
	belowskip=1.5em, % Space below the listing
    basicstyle=\linespread{1.1}\ttfamily, % Line spread of 1.1 between lines and ttfamily font
    upquote=true, % Straight single quotes
    columns=flexible, % Flexible column alignment
    breaklines=true, % Line breaks
    tabsize=4, % 4 spaces per tab
    keepspaces=true, % Not drop spaces to fix column alignment and always convert tabulators to spaces
    %
    % Line numbering:
    numbers=left, % Line numbers on left
	firstnumber=1, % Line numbers start with line 1
	numberstyle=\tt\scriptsize\color{gray}, % Line numbers are gray and small
	numbersep=15pt, % Distance between the numbers and the listing
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
    morekeywords=[2]{this, true, null, false},
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
\surroundwithmdframed{lstlisting}
