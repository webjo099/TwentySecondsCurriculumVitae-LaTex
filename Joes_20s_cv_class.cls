\ProvidesClass{Joes_20s_cv_class}[2020 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%PACKAGES%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}


\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}

\ProcessOptions\relax

\usetikzlibrary{calc}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB0B00}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{cerulean}{HTML}{007BA7}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{maindarkgray}{HTML}{B3B3B3}


\colorlet{fillheader}{gray}
\colorlet{header}{white}
\colorlet{asidecolor}{sidecolor}

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%
% Profile left SideBar %
%%%%%%%%%%%%%%%%

%define the units of the Texpos reference axis. Texpos package to set text to absolute positions (usefull for posters)
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

%set width for profile image to 5cm and scale to 5/600
\newcommand{\imsize}{\linewidth}
\newlength{\imagewidth}
\newlength{\imagescale}
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%

%define profile section, e.g. about me and skills, arg1 is the title, arg2 is the width of the line after the title
\usepackage{calc}
\newcommand{\profilesection}[2]{{\noindent\color{black!80} 
\huge #1 
\rule[0.15\baselineskip]{6.1cm-\widthof{#1}}{1pt}
\vspace{1pt}
}
}

%define contact info and picture
\newcommand{\cvdate}[1]{\renewcommand{\givencvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\givencvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\givennumberphone}{#1}}
\newcommand{\cvaddressA}[1]{\renewcommand{\givencvaddressA}{#1}}
\newcommand{\cvaddressB}[1]{\renewcommand{\givencvaddressB}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\givencvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\givenaboutme}{  \justifying#1}}
\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}
\newcommand{\languages}[1]{\renewcommand{\givenlanguages}{#1}}

\newcommand{\givencvname}{REQUIRED!}
\newcommand{\givencvdate}{}
\newcommand{\givencvmail}{}
\newcommand{\givennumberphone}{}
\newcommand{\givencvaddressA}{}
\newcommand{\givencvaddressB}{}
\newcommand{\givenaboutme}{}
\newcommand{\givenprofilepic}{}
\newcommand{\givencvsite}{}
\newcommand{\givencvjobtitle}{}
\newcommand{\givenlanguages}{}


%define circles icons used for contact info
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}
\newcommand*\round[2]{%
  \tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm,
    text height=3.6mm,  fill=#2,#2,text=white](char){#1} ;}

%define bulletpoint
\newcommand*\bulletpoint[0]{\tikz[baseline=(char.base)]{
	\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {\bullet};}}

%define skills with scalebars
\newcommand\skills[1]{ 

\renewcommand{\givenskill}{
\noindent
\begin{tikzpicture}
\foreach [count=\i] \x/\y in {#1}
{
  \draw[fill=maingray,maingray] (0,-\i) rectangle (6,-\i+0.4);
  \draw[fill=white,mainblue](0,-\i) rectangle (1.2*\y,-\i+0.4);
  \node [above right ] at (0,-\i+0.4) {\x};
  \foreach \z in {0,1,2,...,12}
  {
    \coordinate (A\z) at ($(0,-\i)+(1.2*\z*0.5cm,0)$) {};
    \ifodd\z
        \draw[white] ($(A\z)$) -- ($(A\z)+(0,2.5pt)$);
    \else
        \draw[white] ($(A\z)$) -- ($(A\z)+(0,5pt)$);
    \fi
  }
}
\end{tikzpicture}
}
}

%define skills in text only
\newcommand\skillstext[1]{ 

\renewcommand{\giventextskill}{
\begin{flushleft}
\noindent
\foreach [count=\i] \x/\y in {#1}
{ 
\x$ \star $\y
}
\end{flushleft}
}
}

%first definition of givenskill and giventextskill
\newcommand{\giventextskill}{}
\newcommand{\givenskill}{}
  
%command to create the sidebar once all the arguments have been provided
\newcommand{\makeprofile}
{
%draw grey rectancle for the sidebar
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=asidecolor, anchor=north, minimum width=9.90cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
\end{tikzpicture}

%begin text
\begin{textblock}{6}(0.5, 0.2)
\begin{flushleft}
\hspace{13pt}

%add picture
\ifthenelse{\equal{\givenprofilepic}{}}{}{\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
    \clip (600/2, 567/2) circle (567/2);

        \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\givenprofilepic}};
\end{tikzpicture}}

%add name
{\Huge\color{mainblue}\givencvname}

%add jobtitle
\begin{flushright}
{\Large\color{black!80}\givencvjobtitle}
\end{flushright}

%set vertical spacing between table elements
\renewcommand{\arraystretch}{1.6}
\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{4.5cm}}
\ifthenelse{\equal{\givencvdate}{}}{}{\textsc{\Large\icon{\Info}} & \givencvdate\\}
\ifthenelse{\equal{\givennumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \givennumberphone\\}
\ifthenelse{\equal{\givencvsite}{}}{}{\textsc{\Large\icon{\Mundus}} & \href{\givencvsite}{\textcolor{cerulean}\givencvsite}\\}
\ifthenelse{\equal{\givencvmail}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\givencvmail}{\givencvmail}\\}
\ifthenelse{\equal{\givencvaddressA}{}}{}{\textsc{\Large\icon{\Letter}} & \givencvaddressA\newline\givencvaddressB}
\end{tabular}

%add about me section
\profilesection{About me}{3.2 cm}
\givenaboutme

%add skill section
\profilesection{Skills}{5cm}
\givenskill
\giventextskill
\noindent
\scriptsize
\noindent
(*)[The skill scale is from 0 (Fundamental Awareness) to 5 (Expert).]
\normalsize

%add language section
\profilesection{Languages}{5cm}
\newline
\givenlanguages


\end{flushleft}
\end{textblock}
\vspace{-10pt}
 }


%%%%%%%%%%%%%%%%
% Section Color box %
%%%%%%%%%%%%%%%%

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
   \round{#1#2#3}{
      \ifcase\value{colorCounter}%
        maingray\or%
        mainblue\or%
        maingray\or%
        mainblue\else%
        maingray\fi%
    }%
  }%
  \stepcounter{colorCounter}%
}

%redefine section from article class
\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE 
    \color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

%redefine subsection from article class
\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% Create environment for date and 3 text items%
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{date_3text}{%
  
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\event}[4]{%
  \hspace{5pt}#1&\parbox[t]{11.5cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize#3}\\%
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%%%%%%%%%%%%
%Create environment for 3 text items %
%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\task}[3]{
    \hspace{5pt}%
    \parbox[t]{13.5cm}{%
    \textbf{#1}%
    \hfill%
    {\footnotesize#2}\\%
    #3\vspace{\parsep}%
  }\\}

\setlength{\tabcolsep}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%
%  % Create commands for simple 5pt hspacing %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\spacefive}[1]{
    \hspace{5pt}%
    \parbox[t]{13.5cm}{#1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Create commands for references %
%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\referenceA}[1]{\renewcommand{\givenreferenceA}{#1}}
\newcommand{\givenreferenceA}{}
\newcommand{\referenceB}[1]{\renewcommand{\givenreferenceB}{#1}}
\newcommand{\givenreferenceB}{}

\newcommand{\addreferences}{
\hspace{5pt}
\parbox{.45\linewidth}{\givenreferenceA}
\hspace{15pt}
\parbox{.45\linewidth}{\givenreferenceB}
}

%%%%%%%%%%%%
% Page Setting %
%%%%%%%%%%%%

\RequirePackage[left=7.3cm,top=0.1cm,right=0.5cm,bottom=0.2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
