% !TEX encoding = UTF-8 Unicode

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modern}[2018/11/11 v2
  Classic document class]

% ----------
% Base class
% ----------
\LoadClassWithOptions{article}


% -----------------
% External packages
% -----------------
% Required for beautiful tables
\RequirePackage{booktabs}
% Required for lists customisation
\RequirePackage{enumitem}
% Required for font encoding
\RequirePackage{fontspec}
% Required for custom headers and footers
\RequirePackage{fancyhdr}
% Required to put figures where you actually want
\RequirePackage{float}
% Margins definition
\RequirePackage[margin=3.5cm]{geometry}
% Required for graphics inclusions
\RequirePackage{graphicx}
% Required for links
\RequirePackage{hyperref, url}
% Required to get the last page number
\RequirePackage{lastpage}
% Required for insertion of code
\RequirePackage{listings}
% Text Com­pan­ion fonts, which pro­vide many text sym­bols
\RequirePackage{textcomp}
% Required for color definitions
\RequirePackage{xcolor}
% Needed for \if-\then-\else statements
\RequirePackage{xifthen}
% Required for coloured frames
\RequirePackage{tikz}
% Required for sections customisation
\RequirePackage{titlesec}
% Required for translations
%\RequirePackage{translations}


% ---------------------------------
% Additional commands for meta data
% ---------------------------------
% Institute
\newcommand{\institute}[1]{\def\@institute{#1}}
% Subject
\newcommand{\subject}[1]{\def\@subject{#1}}


% ------------------
% Document structure
% ------------------

% Title page
% ----------
\newcommand{\maketitlepage}{%
  \begin{titlepage}
    \pagenumbering{roman}
    \setcounter{page}{1}
    \thispagestyle{empty}
    \begin{center}%
      \vglue 2cm%
      {\Huge\bfseries\MakeUppercase{\@title}\par}%
      \ifthenelse{\isundefined{\@subject}}{}{
        \vskip 1cm%
        {\LARGE\@subject\par}%
      }%
      \vskip 1cm%
      {\large
       \lineskip .75em%
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par
      }%
      \vskip 2cm%
      {\large\@date\par}%
      \ifthenelse{\isundefined{\@institute}}{}{
        \vfill%
        {\large\@institute\par}%
        \vskip 3cm%
      }%
    \end{center}
  \end{titlepage}
  \addtocounter{page}{1}
  \null
  \thispagestyle{empty}%
  \newpage%
}

% Header
% ------
\newcommand{\makeheader}{%
  \thispagestyle{plain}% no fancy header
  \noindent%
  \begin{center}%
    {\huge\bfseries\@title}%
    \vskip .5cm%
    {\Large{\@subject}}%
    \vskip .5cm%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par
    }%
    \vskip .5cm%
    {\large\@date\par}%
  \end{center}%
  \vskip 1em
}

% Table of contents
% -----------------
\addtocontents{toc}{~\hfill\textbf{Page}\par}

\newcommand\maketoc{
  \thispagestyle{empty}%
  \renewcommand{\contentsname}{%
    \hfill\MakeUppercase{Table des matières}\hfill\break\vskip -.8cm%
    \hfill\rule{3cm}{.6pt}\hfill%
  }
  \tableofcontents
  \newpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

% Fancyhdr (headers and footers)
% ------------------------------
\pagestyle{fancy}
\fancyhf{} % clear all header and footer fields
\fancyfoot[C]{\thepage\ sur~\pageref{LastPage}} % except the center
\renewcommand{\headrulewidth}{0pt} % no rule in head
\renewcommand{\footrulewidth}{0pt} % no rule in foot

% Line spacing
% ------------
\renewcommand{\baselinestretch}{1.2}

% Lists configuration
% -------------------
\setlist{after=\vspace{0cm}}


% ---------------------
% Colours configuration
% ---------------------
% Greyscale
\definecolor{inlinecode}{HTML}{F3F4F4}
\definecolor{codeblockbackground}{HTML}{F3F4F4}
\definecolor{headingrulecolour}{HTML}{EAECEF}
% Actual colours
\definecolor{blue}{HTML}{005CC5}
\definecolor{dark-blue}{HTML}{032F62}
\definecolor{grey}{HTML}{6A737D}
\definecolor{green}{HTML}{22863A}
\definecolor{orange}{HTML}{E36209}
\definecolor{purple}{HTML}{6F42C1}
\definecolor{red}{HTML}{D73A49}


% -----------------------------------------
% Code inclusion configuration (lstlisting)
% -----------------------------------------

% Code snippets
% -------------
\newcommand\code[1]{%
  \tikz[baseline]%
  \node[rectangle,
        inner ysep=-1.5pt, inner xsep=3pt,
        anchor=text, fill=codeblockbackground]{%
        \strut{\textcolor{black}{\lstinline[basicstyle=\ttfamily\normalsize]{#1}}}%
  };%
}

\newcommand\bare[1]{\lstinline[basicstyle=\ttfamily\normalsize]{#1}}

% General configuration
% ---------------------
\lstset {
    frame=single, % frame around listing
    rulecolor=\color{codeblockbackground},
    backgroundcolor=\color{codeblockbackground},
    framesep=5pt,
    %framexleftmargin=5pt, % margin between the code and the frameline
    %framexrightmargin=5pt,
    %framextopmargin=3pt,
    %framexbottommargin=3pt,
	xleftmargin=4pt, % margin between the left border of the page and the listing
	belowcaptionskip=3\smallskipamount,
    basicstyle=\linespread{1.1}\ttfamily\small, % general style in the listing
    upquote=true, % straight single quotes
    columns=flexible, % flexible column alignment
    breaklines=true, % line breaks
    tabsize=4, % 4 spaces per tab
    keepspaces=true, % not drop spaces to fix column alignment and always convert tabulators to spaces
    %
    % Line numbering:
    numbers=none, % Line numbers on left
	firstnumber=1, % Line numbers start with line 1
	numberstyle=\tt\scriptsize\color{grey}, % Line numbers are grey and small
	numbersep=15pt, % Distance between the numbers and the listing
	%
    % Style:
    commentstyle=\color{grey}\slshape,
    showstringspaces=false, % Don't put marks in string spaces
    %
    % Keywords:
    keywordstyle=[1]\bfseries, % Keywords style
    keywordstyle=[2]\bfseries, % Built-in functions style
    keywordstyle=[3]\bfseries, % Other methods style
}

% Pseudo-code configuration
% ------------------
\lstdefinelanguage{Pseudo} {
    %xleftmargin=5pt,
    %numbers=none,
    numberstyle=\rmfamily\scriptsize,
    basicstyle=\rmfamily,
    mathescape=true
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
    morecomment=[l][\color{grey}]{\#}, % Python comments (#)
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
