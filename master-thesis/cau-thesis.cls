%%=================================================================
%%
%% cau-thesis.cls (Mar 02, 2001)
%%
%% Document class for CAU thesis with HLaTeX-0.98
%%
%% Modified By Choi, Jae-Hoon (goopy74@yahoo.com)
%%
%% Note 1: Required Packages: HLaTeX0.98 and setspace.
%%      2: The class file follws the guide distributed by
%%         the office of the academic affairs in CAU.
%%      3: The class file is based on kaist.cls 96/01/13 version
%%         made by Jae Choon Cha.
%%      4: The class file is based on kaist-thesis.cls 98/11/23
%%         version made by Jin-Hwan, Cho.
%%
%%================================================================
%%
%% cau-thesis.cls (Dec, 2007)
%% 
%% Modified by Nam, Kee-Hwan (khnam@phys.cau.ac.kr)
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cau-thesis}[2010/05/02 Document class for CAU thesis with ko.Tex Live 2009]
%%
%%
\RequirePackage{ifpdf}

%%
\DeclareOption{hangul}{\PassOptionsToPackage{hangul}{kotex}}
\PassOptionsToPackage{nonfrench,finemath}{kotex}
\ProcessOptions\relax
\RequirePackage{kotex}
\ifpdf
  \input glyphtounicode\pdfgentounicode=1
\fi
%%
\ExecuteOptions{12pt,oneside}
\DeclareOption{korean}{\gdef\@korean{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass{report}
%%
\PassOptionsToPackage{b5j}{geometry}
\PassOptionsToPackage{includefoot,top=30mm,bottom=20mm,left=30mm,right=25mm}{geometry}
\PassOptionsToPackage{headheight=10mm,headsep=0mm,footskip=10mm}{geometry}
\PassOptionsToPackage{verbose}{geometry}
\ProcessOptions\relax
\RequirePackage{geometry}
\overfullrule=0pt
%%
\AtBeginDocument{\make@covertitle}
%%
%\topmargin=0mm
%%\advance\topmargin 19mm        % comment out if want exact top margin
%\oddsidemargin=-2mm
%%\advance\oddsidemargin 10mm    % comment out if want exact left margin
%\evensidemargin=\oddsidemargin
%\textwidth=176mm
%%\advance\textwidth by-60mm
%%\textheight=262mm
%\textheight=250mm
%\advance\textheight by30mm
%\footskip=10mm
%\headheight=10mm
%\headsep=0mm
%\overfullrule=0pt

%%
\def\bibname{References}
\def\summaryname{국 문 초 록}
\def\ackname{감 사 의 글}
\def\vitaname{이 력 서}
\def\esummaryname{국문초록}
\def\eackname{Acknowledgement in Korean}
\def\evitaname{Curriculum Vitae in Korean}
%%
\def\code#1{\def\@code{#1}}
\def\gcount#1{\def\@gcount{#1}}
\def\edegree#1{\def\@edegree{#1}}
\def\edept#1{\def\@edept{#1}}
\def\kdept#1{\def\@kdept{#1}}
\def\emajor#1{\def\@emajor{#1}}
\def\kmajor#1{\def\@kmajor{#1}}
\def\etitle#1{\def\@etitle{#1}}
\def\ktitle#1{\def\@ktitle{#1}}
\def\advisor#1{\def\@advisor{#1}}
\def\coadvisor#1{\def\@coadvisor{#1}}
\def\ename#1{\def\@ename{#1}}
\def\kname#1{\def\@kname{#1}}
\def\knamenospace#1{\def\@knamenospace{#1}}
\def\cname#1{\def\@cname{#1}}
\def\studentid#1{\def\@studentid{#1}}
\def\coveryear#1{\def\@coveryear{#1}}
\def\advisorsigndate#1#2#3{\def\@advisorsigndate{#1. #2. #3.}}
\def\refereesigndate#1#2#3{\def\@refereesigndate{#1년 #2월 #3일}}
\def\refereeA#1{\def\@refereeA{#1}}
\def\refereeB#1{\def\@refereeB{#1}}
\def\refereeC#1{\def\@refereeC{#1}}
\def\refereeD#1{\def\@refereeD{#1}}
\def\refereeE#1{\def\@refereeE{#1}}
\def\npages#1{\def\@npages{#1}}
\def\@npages{\pageref{paperlastpagelabel}}
\def\D@char{D}
\def\split@code#1#2\eop{\def\@md{#1}\def\@dept{#2}}
%%
\def\insert@hss#1#2{#1#2\hss}
\def\maketitlebreakwork{\def\titlebreak{\\\ignorespaces}}
\def\maketitlebreaknotwork{\def\titlebreak{\ }}
\maketitlebreaknotwork
\pagestyle{plain}
%%
\def\make@covertitle{%
  % \newgeometry{nohead,nofoot,top=25mm,bottom=25mm,left=30mm,right=30mm}
  
  \ifx\@korean\@@@@undefined@@@@\else
    \def\contentsname{목 차}
    \def\listfigurename{그 림 목 차}
    \def\listtablename{표 목 차}
    \def\refname{참 고 문 헌}
    \def\bibname{참 고 문 헌}
    \def\figurename{그림}
    \def\tablename{표}
  \fi
  \expandafter\split@code\@code\eop
  \ifx\D@char\@md\def\@kdegree{박사}\else\def\@kdegree{석사}\fi
  
% 앞표지 및 속표지 (Front Cover and Inner cover)
  \thispagestyle{empty}
  \vbox to \textheight{%
    \begin{flushleft}
    \maketitlebreakwork\leavevmode%
    \makebox[23mm][s]{\fontsize{14}{34pt}\selectfont\expandafter{제 }\@gcount{ 회}}\hspace{5mm}
    \makebox[30mm][s]{\fontsize{14}{34pt}\selectfont\expandafter\@kdegree{학위논문}}\\
    \makebox[23mm][s]{\fontsize{14}{34pt}\selectfont\expandafter{지 도 교 수}}\hspace{5mm}
    \makebox[30mm][s]{\fontsize{14}{34pt}\selectfont\expandafter\@advisor}\\
    \end{flushleft}
    \vspace{1cm}
    \begin{center}
    \fontsize{21}{35pt}\selectfont\@ktitle\\[5mm]
    \fontsize{17.5}{30pt}\selectfont\@etitle\\
    \null\vspace{\stretch{1}}
    \fontsize{17.5}{30pt}\selectfont중앙대학교\hspace{5mm} 대학원\\
    \fontsize{14}{30pt}\selectfont
    \@kdept{ }\@kmajor{ }전공\\
    \makebox[3.5cm][s]{\@kname}\\
    \@coveryear
    \maketitlebreaknotwork
    \end{center}
  }
  
% 제출서(국,영문 제목 기재)
  \newpage\thispagestyle{empty}
  \vbox to\textheight{%
    \null\vspace{\stretch{1}}
    \begin{center}
    \maketitlebreakwork
    \fontsize{21}{35pt}\selectfont\@ktitle\\[5mm]
    \fontsize{17.5}{30pt}\selectfont\@etitle\\[5.5cm]
    이 논문을 \@kdegree학위 논문으로 제출함\\[1.5cm]
    \@coveryear\\[2cm]
    \fontsize{17.5}{30pt}\selectfont중앙대학교\hspace{5mm} 대학원\\
    \fontsize{14}{30pt}\selectfont
    \@kdept{ }\@kmajor{ }전공\\
    \makebox[3.5cm][s]{\@kname}
    \maketitlebreaknotwork
    \end{center}
  }
  
% 학위논문 심사완료 검인(실인으로 날인)
  \newpage\thispagestyle{empty}
  \vbox to\textheight{%
    \null\vspace{\stretch{1}}
    \fontsize{17.5}{35pt}\selectfont\@knamenospace의 \@kdegree 학위 논문으로 인정함\\[15mm]
    % \begin{flushright}
    \begin{center}
      \fontsize{14}{30pt}\selectfont
      \makebox[3cm][s]{심 사 위 원 장}\hspace{5mm}\underline{\hspace{40mm}} 인\\
      \makebox[3cm][s]{심 사 위 원}\hspace{5mm}\underline{\hspace{40mm}} 인\\
      \makebox[3cm][s]{심 사 위 원}\hspace{5mm}\underline{\hspace{40mm}} 인\\
      \ifx \D@char\@md
      \makebox[3cm][s]{審 査 委 員}\hspace{5mm}\underline{\hspace{40mm}} 印\\
      \makebox[3cm][s]{審 査 委 員}\hspace{5mm}\underline{\hspace{40mm}} 印\\
      \fi
    \end{center}
    % \end{flushright}
    \vspace{8cm}
    \begin{center}
    \fontsize{17.5}{30pt}\selectfont중앙대학교\hspace{5mm} 대학원\\
    \fontsize{14}{30pt}\selectfont
    \@coveryear
    \end{center}
  }
  
\clearpage\newpage
\restoregeometry
} % end of \make@covertitle

\def\@chapapp{}
\def\@makechapterhead#1{%
  \vspace*{5mm}%
  {\parindent=0pt
    \begin{center}
    \ifnum\c@secnumdepth>\m@ne\LARGE\bfseries\@chapapp{ }\thechapter{. }\fi
    \LARGE\bfseries#1\par\nobreak
    \vspace{5mm}
    \end{center}%
  }%
}
\def\@makeschapterhead#1{%
  \vspace*{5mm}%
  {\parindent=0pt
    \begin{center}
    \LARGE\bfseries#1\par\nobreak
    \vspace{5mm}
    \end{center}%
  }%
}
\def\section{\@startsection {section}{1}{\z@}%
  {3.5ex plus 1ex minus .2ex}%
  {2.3ex plus .2ex}%
  {\normalfont\Large\bfseries}}
\def\subsection{\@startsection{subsection}{2}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {1.5ex plus .2ex}%
  {\normalfont\large\bfseries}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {1em}%
  {\normalfont\bfseries}}

% 백색 별지

% 목차(Contents)
\def\makecontents{%
%  {\let\thispagestyle\@gobble \tableofcontents}%
  \pagenumbering{roman}\setcounter{page}{1}
  \tableofcontents
    \listoffigures
  \listoftables%
  \newpage%
}

% 표 및 그림 목록(Tables and Figures)
%\def\makelist{
%  {\let\thispagestyle\@gobble \tableofcontents}%
% \pagenumbering{roman}\setcounter{page}{2}
%  \listoffigures
%  \listoftables

%}



\def\appendix{%
  \par\setcounter{chapter}{0}\setcounter{section}{0}
  \ifx\@korean\@@@@undefined@@@@\def\@chapapp{Appendix}\else\def\@chapapp{부 록}\fi
  \def\thechapter{\Alph{chapter}}%
}

% 국문요약(Summary, 본문이 외국어인 경우만 작성)
\def\summary{%
  \chapter*{\summaryname}
  \ifx\@korean\@@@@undefined@@@@
  \addcontentsline{toc}{chapter}{\esummaryname}
  \else
  \addcontentsline{toc}{chapter}{\summaryname}
  \fi
  \begin{center}
  \fontsize{14}{21pt}\selectfont{\maketitlebreakwork\bfseries\@ktitle\maketitlebreaknotwork}
  \end{center}
  \vspace*{5mm}%
}

% 참고문헌(References)
\def\thebibliography#1{%
  \chapter*{\bibname\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth\labelwidth{\@biblabel{#1}}%
  \leftmargin\labelwidth
  \advance\leftmargin\labelsep
  \itemsep\medskipamount
  \@openbib@code
  \usecounter{enumiv}%
  \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m%
}

% 논문초록(Abstract, 영문으로 작성)
\def\abstract{%
  %\pagenumbering{roman}\setcounter{page}{4}
  \addcontentsline{toc}{chapter}{Abstract}
  \vspace*{10mm}
  \begin{center}
    \fontsize{17}{25pt}\selectfont\bfseries Abstract
  \end{center}
  \vspace{10mm}
  \advance\linewidth by-30mm
  \begin{flushright}
  \parbox[t]{\linewidth}{\sffamily\fontsize{10}{12pt}\selectfont
    \begin{flushright}
    \@ename\\
    Department of \@edept\\
    Graduate School of Chung-Ang University
    \end{flushright}
  }\\[1cm]
  \end{flushright}
}
\def\endabstract{\newpage}

% 감사의말(Acknowledgement)
\def\acknowledgement{%
  \label{paperlastpagelabel}
  \chapter*{\ackname}
  \thispagestyle{empty}\pagestyle{empty}
%  \ifx\@korean\@@@@undefined@@@@
%  \addtocontents{toc}{\protect\contentsline{chapter}{\eackname}{}}
%  \addcontentsline{toc}{chapter}{\eackname}%
%  \else
%  \addtocontents{toc}{\protect\contentsline{chapter}{\ackname}{}}
%  \addcontentsline{toc}{chapter}{\ackname}%
%  \fi
}

% 백색 별지

% 뒤표지(Back Cover)

\endinput

