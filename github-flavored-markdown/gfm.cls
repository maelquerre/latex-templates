% !TEX encoding = UTF-8 Unicode

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gfm}

% --------------
% Base class
% --------------
\LoadClassWithOptions{article}

% --------------
% Other packages
% --------------
\RequirePackage{fontspec} % Needed for XeLaTeX fonts selection
\RequirePackage[margin=2cm]{geometry}  % Margin definition
\RequirePackage[normalem]{ulem}  % Needed for scratched text
\RequirePackage{titlesec} % Needed for sections customisation
\RequirePackage[table]{xcolor} % Needed to manage colors
\RequirePackage[framemethod=TikZ]{mdframed} % Needed for mdframed frames
\RequirePackage{listings} % Needed for lstlistings
\RequirePackage{url, hyperref} % Needed for links

% ------------------
% Fonts declarations
% ------------------
\setmainfont{SF-Pro-Text}[Path=fonts/,
                          UprightFont=*-Regular,
                          BoldFont=*-Semibold,
                          ItalicFont=*-RegularItalic,
                          BoldItalicFont=*-SemiboldItalic]

% Mono font of the document:
\setmonofont{SFMono}[Path=fonts/,
                     UprightFont=*-Regular,
                     BoldFont=*-Bold,
                     ItalicFont=*-RegularItalic,
                     BoldItalicFont=*-BoldItalic,
                     Scale=0.9]

% Setting heading font for sections and subsections:
\newfontfamily\headingfont{SF-Pro-Display}[Path=fonts/,
                                           UprightFont=*-Regular,
                                           BoldFont=*-Semibold,
                                           ItalicFont=*-RegularItalic,
                                           BoldItalicFont=*-SemiboldItalic]


% No section numbering
\setcounter{secnumdepth}{0}

% No indent by default
\newlength\tindent
\setlength{\tindent}{\parindent}
\setlength{\parindent}{0pt}
\renewcommand{\indent}{\hspace*{2.5em}}

% Line spacing
\renewcommand{\baselinestretch}{1.3}

% ---------------------
% Table configuration
% ---------------------
\rowcolors{2}{backgray}{white}  % Alternate row colours
\arrayrulecolor{arrayrulegray} % Array rule colour
\setlength\arrayrulewidth{1\p@} % Rule width
\renewcommand{\arraystretch}{2}  % Cell vertical spacing
\setlength{\tabcolsep}{0.5cm}  % Cell horizontal spacing

% ---------------------
% Colours configuration
% ---------------------
\definecolor{deep-gray}{RGB}{36,41,46}
\definecolor{darkgray}{RGB}{50,50,50}
\definecolor{gray}{RGB}{106,115,125}
\definecolor{arrayrulegray}{RGB}{223,226,229}
\definecolor{rulegray}{RGB}{234,236,239}
\definecolor{code-gray}{RGB}{244,244,245}
\definecolor{backgray}{RGB}{246,248,250}
\definecolor{red}{RGB}{215,58,73}
\definecolor{blue}{RGB}{0,92,197}
\definecolor{dark-blue}{RGB}{3,47,98}
\definecolor{purple}{RGB}{111,66,193}
\definecolor{orange}{RGB}{227,98,9}

% mdframed configuration
% ----------------------
\mdfsetup{leftmargin=0,
          rightmargin=0,
          innertopmargin=5pt,
          innerrightmargin=10pt,
          innerbottommargin=5pt,
          innerleftmargin=10pt,}

%----------------------------------------------------------------------------------------
%	CODE INCLUSION CONFIGURATION
%----------------------------------------------------------------------------------------
% -- Java configuration --
% Set the delimiter for Java classes declarations
\newcommand{\javaClassHighlight}[1]{\textcolor{red}{class} \textcolor{purple}{#1} \{}

\lstdefinelanguage{Java} {
    % Mots-clés standards:
    keywords={abstract, assert, boolean, break, byte, case, catch, char, class, const,
              continue, default, do, double, else, enum, extends, final, finally, float,
              for, goto, if, implements, import, instanceof, int, interface, long, native,
              new, package, private, protected, public, return, short, static, strictfp,
              super, switch, synchronized, throw, throws, transient, try, void,
              volatile, while},
    morekeywords=[2]{this, true, null, false},
    %moredelim=[is][\javaClassHighlight]{class\ }{\{}, % Délimiteur pour les classes
    morecomment=[s]{/*}{*/},
    morecomment=[l]{//},
    morestring=[b]',
    morestring=[b]",
    % Operators:
    % (The colour of otherkeywords is the same colour as keywordstyle[1])
    otherkeywords={+, -, =, <, >, \%, +=, -=, *=, .}, % unable to set * and / as operators with comments (// and /**/)
    moredelim=[is][\javaClassHighlight]{class\ }{\{}, % Delimiter for classes declarations
}

% -- Python configuration --
% Set the delimiter for classes declarations
\newcommand{\pythonClassHighlight}[1]{\textcolor{red}{class} \textcolor{purple}{#1}:}
% Set the delimiter for functions declarations
\newcommand{\functionDefHighlight}[1]{\textcolor{red}{def} \textcolor{purple}{#1}(}
% Set the delimiter for special methods declarations
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
    moredelim=[is][\pythonClassHighlight]{class\ }{:}, % Delimiter for classes declarations
	moredelim=[is][\functionDefHighlight]{def\ }{(}, % Delimiter for functions declarations
	moredelim=[is][\specialMethodHighlight]{def\ __}{__}, % Delimiter for special methods declarations
	moredelim=[s][\color{blue}]{__}{__}, % Delimiter for special methods
}
                                          
% -- General configuration --
\lstset {
    frame=none, % No frame around code
    backgroundcolor=\color{backgray}, % Background colour
    basicstyle=\linespread{1.1}\ttfamily, % Line spread and ttfamily font
    upquote=true, % Straight single quotes
    columns=flexible, % Flexible column alignment
    breaklines=true, % Line breaks
    keepspaces=true, % Not drop spaces to fix column alignment and always convert tabulators to spaces
    commentstyle=\color{gray}, % Comments are gray
    stringstyle=\color{dark-blue}, % Strings are dark-blue
    showstringspaces=false, % Don't put marks in string spaces
    tabsize=4, % 4 spaces per tab
    %
    keywordstyle=[1]\color{red}, % Keywords style
    keywordstyle=[2]\color{blue}, % Built-in functions style
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
}

\surroundwithmdframed[
  hidealllines=true, % hide mdframed lines
  font=\ttfamily,
  backgroundcolor=backgray,
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
    linecolor=arrayrulegray,
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
\titleformat{\section}{\huge\bfseries\headingfont}{\thesection}{1em}{}[{\color{rulegray}\titlerule[1pt]}]  % horizontal rule under sections
\titleformat{\subsection}{\LARGE\bfseries\headingfont}{\thesubsection}{1em}{}[{\color{rulegray}\titlerule[1pt]}]  % horizontal rule under subsections
\titleformat{\subsubsection}{\Large\bfseries\headingfont}{\thesubsection}{1em}{}[{\color{rulegray}}]
\titleformat*{\paragraph}{\large\bfseries\headingfont}


