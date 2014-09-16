%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{cv}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}




%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\defaultfontfeatures{Mapping=tex-text}

\setmainfont[Path = fonts/ ,%
        Extension = .ttf,%
        ExternalLocation,%
        Mapping = tex-text,
        Color = textcolor,
        UprightFont = fonts/*-Lt,%
        BoldFont = fonts/*-Roman,%
        ItalicFont = fonts/*-LtIt,%
        BoldItalicFont = fonts/*-It %
    ]{HelveticaNeueLTCom}

\newfontface\thinfont[Path = fonts/]{HelveticaNeueLTCom-UltLt}
\newfontface\headingfont[Path = fonts/]{HelveticaNeueLTCom-BdCn}


\setmathfont{xits-math.otf}


%%%%%%%%%%%%%%%%%%
% Colors Defined %
%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{vargray}{HTML}{525252}

\definecolor{gray}{HTML}{262626}

\definecolor{sec}{HTML}{41BDC9}

\colorlet{fillheader}{gray}
\colorlet{header}{white}

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%%
% Color Control %
%%%%%%%%%%%%%%%%%

\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{sec} #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont \MakeLowercase{#1}}{\normalfont \MakeLowercase{#2}}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{12pt}{22pt}\color{header}%
      \normalfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
    \begin{tabular}{@{}p{0.2\textwidth}@{}p{0.8\textwidth}}
}{%
  \end{tabular}
}
\newenvironment{entrylistnd}{%
  \begin{itemize}\addtolength{\itemsep}{-0.2\baselineskip}
}{%
  \end{itemize}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=vargray} #3}\\%
    ~&#4\vspace{\parsep}%
  \\}
\newcommand{\entryorig}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=vargray} #3}\\%
    #4\vspace{\parsep}%
  }\\}
\newcommand{\entrynd}[1]{%
  \item {%
    \textbf{#1}
  }}

%%%%%%%%%
% Aside %
%%%%%%%%%

\RequirePackage[overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.8}(-5.2, -0.3)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

