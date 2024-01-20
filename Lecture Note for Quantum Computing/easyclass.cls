%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% easyclass.cls - LaTeX2e class for Lecture Note use.
%% To Make Lecture Note for Computer Science Courses
%%	Version 1.00
%%  written by Naijia Fan, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{easyclass}[2/6/2019 custom lecture note class]
\LoadClass[twoside=false]{scrbook}
\RequirePackage{mathtools,amssymb,bm,bbold,enumerate}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{hyperref,cleveref}

\usepackage{booktabs} 
\usepackage[subrefformat=parens,labelformat=parens]{subfig} %

\newcommand\myshade{90}
\colorlet{mylinkcolor}{NavyBlue}
\colorlet{mycitecolor}{Aquamarine}
\colorlet{myurlcolor}{Aquamarine}

\hypersetup{
	linkcolor  = mylinkcolor!\myshade!black,
	citecolor  = mycitecolor!\myshade!black,
	urlcolor   = myurlcolor!\myshade!black,
	colorlinks = true,
}


%--------------------------------------------------------------------
% Bibliography
\RequirePackage[]{natbib}
\bibliographystyle{chicago}

%--------------------------------------------------------------------
% Theorem
%=================================
% pre-defined theorem environments
% custom theorem boxes
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{amsthm}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{definition}{Definition}
\newtheorem*{remark}{Remark}
\newtheorem*{assumption}{Assumption}
%Theorem
\newcounter{theo}[chapter] \setcounter{theo}{0}
\renewcommand{\thetheo}{\arabic{chapter}.\arabic{theo}}
\newenvironment{theo}[2][]{%
	\refstepcounter{theo}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=blue!20]
				{\strut Theorem~\thetheo};}}
	}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=blue!20]
				{\strut Theorem~\thetheo:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=blue!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}
%Lemma
\newcounter{lem}[theo] %\setcounter{lem}{0}
\renewcommand{\thelem}{\arabic{chapter}.\arabic{theo}}
\newenvironment{lem}[2][]{%
	\refstepcounter{theo}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=green!20]
				{\strut Lemma~\thelem};}}
	}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=green!20]
				{\strut Lemma~\thelem:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=green!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}
%Proof
\newcounter{prf}[theo]%\setcounter{prf}{0}
\renewcommand{\theprf}{\arabic{chapter}.\arabic{theo}}
\newenvironment{prf}[2][]{%
	\refstepcounter{prf}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=red!20]
				{\strut Proof~\theprf};}}
	}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=red!20]
				{\strut Proof~\theprf:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=red!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax%
		\label{#2}}{\qed\end{mdframed}}



	

%=================================
% useful commands
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\supp}{supp}

\def\vec#1{{\ensuremath{\bm{{#1}}}}}
\def\mat#1{\vec{#1}}
\def\bvec#1{\mathbf{#1}}

%=================================
% convenient notations
\newcommand{\XX}{\mathbb{X}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\EE}{\mathbb{E}}
\newcommand{\PP}{\mathbb{P}}

\newcommand{\sL}{\mathcal{L}}
\newcommand{\sX}{\mathcal{X}}
\newcommand{\sY}{\mathcal{Y}}

\newcommand{\ind}{\mathbb{1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typography, change document font
\RequirePackage[tt=false, type1=true]{libertine}
\RequirePackage[varqu]{zi4}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[T1]{fontenc}

%\RequirePackage[protrusion=true,expansion=true]{microtype}

% Disable paragraph indentation, and increase gap
\RequirePackage{parskip}

%=================================
% header and footer
\RequirePackage{scrpage2}
\pagestyle{scrheadings}
\deftripstyle{pagestyle}
%   [0.5pt]
%   [0.3pt]
{}
{}
{\headmark}
{}
{\pagemark}
{}

\pagestyle{pagestyle}
\renewcommand{\chapterpagestyle}{pagestyle}


%=================================
% draw pictures
\RequirePackage{tikz}
\usetikzlibrary{arrows,positioning,calc} 
\tikzstyle{labeled}=[execute at begin node=$\scriptstyle,
execute at end node=$]
\RequirePackage{graphicx}

%=================================
% title page
% define university 
\def\@university{no university}
\newcommand{\university}[1]{
	\def\@university{#1}
}
% define course id
\def\@courseid{CS 000}
\newcommand{\courseid}[1]{
	\def\@courseid{#1}
}
% define version
\def\@version{Great Year}
\newcommand{\version}[1]{
	\def\@version{#1}
}
% define instructor info
\def\@instructor{Instructor}
\newcommand{\instructor}[1]{
	\def\@instructor{#1}
}
% define email info
\def\@email{Email}
\newcommand{\email}[1]{
	\def\@email{#1}
}
% define affiliation info
\def\@affiliation{Affiliation}
\newcommand{\affiliation}[1]{
	\def\@affiliation{#1}
}
% define ta info
\def\@ta{TA}
\newcommand{\ta}[1]{
	\def\@ta{#1}
}
% make title
\renewcommand{\maketitle}{
	\centering
	{\huge\bfseries{\@title} \par}
	\vspace{1cm}
%	{\LARGE{\@instructor} \par \LARGE{\@ta} \par}
	{\LARGE{\@instructor} \par}
	{\Large{\@email} \par}
	\vspace{1cm}
%	{\scshape{\Large  \@university, \@courseid} \par}
	{\scshape{\large  \@affiliation} \par}
	\vspace{1.5cm}
	\includegraphics[width=\textwidth]{figures/qc.jpeg}
	\vfill
	% Bottom of the page
%	{\Large\itshape \@author \par}
	{\large \@version \par}
}

%=================================
% add current instructor info 
% on the right
\newcommand{\curinstructor}[1]{
	% instructor info
	\vfill
	\begin{flushright}
		Instructor: #1
	\end{flushright}
}

\graphicspath{{./figures/}}
\usepackage{braket}
\usepackage{indentfirst} 
\setlength{\parindent}{1.5em}
\usepackage{amsmath,amssymb}

% =================== 用来绘制一个更长的波浪箭头 ================================
\usepackage{tikz}
\usetikzlibrary{decorations.pathmorphing}
\newlength{\LETTERheight}
\AtBeginDocument{\settoheight{\LETTERheight}{I}}
\newcommand*{\longleadsto}[1]{\ \raisebox{0.24\LETTERheight}{\tikz \draw [->,
		line join=round,
		decorate, decoration={
			zigzag,
			segment length=4,
			amplitude=.9,
			post=lineto,
			post length=2pt
		}] (0,0) -- (#1,0);}\ }
	
% =================== 用来定义一个例题环境 ================================
\usepackage{xcolor}
\definecolor{myBlue}{RGB}{107,142,208}


\newcounter{example}[chapter] \setcounter{example}{0}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\newenvironment{example}[2][]{%
	\refstepcounter{example}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
%				\node[anchor=east,rectangle,fill=blue!20]
				\node[anchor=east,rectangle,fill=myBlue]
				{\strut \textcolor{white}{Example~\theexample}};}}
	}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
%				\node[anchor=east,rectangle,fill=blue!20]
				\node[anchor=east,rectangle,fill=myBlue]
				{\strut \textcolor{white}{Example~\theexample:~#1}};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=myBlue,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}

\newcounter{note}[chapter] \setcounter{note}{0}
\renewcommand{\thenote}{\arabic{chapter}.\arabic{note}}
\newenvironment{note}[2][]{%
	\refstepcounter{note}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				%				\node[anchor=east,rectangle,fill=blue!20]
				\node[anchor=east,rectangle,fill=red]
				{\strut \textcolor{white}{Note~\thenote}};}}
	}%
	{\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				%				\node[anchor=east,rectangle,fill=blue!20]
				\node[anchor=east,rectangle,fill=red]
				{\strut \textcolor{white}{Note~\thenote:~#1}};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=red,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}
	


% ===========================中文字体支持===============================================
% 字体需要根据自己电脑系统来设置
%\usepackage{xeCJK}
%\setmainfont{Times New Roman}
%\setCJKmainfont{宋体}

%\setCJKfamilyfont{zhhei}{黑体}
%\newcommand*{\hei}{\CJKfamily{zhhei}}
%\setCJKfamilyfont{zhkai}{楷体}
%\newcommand*{\kai}{\CJKfamily{zhkai}}
%\setCJKfamilyfont{enroman}{Times New Roman}
%\newcommand*{\mytimes}{\CJKfamily{enroman}}

%% ===========================数学符号===============================================
%\usepackage{amsmath,amssymb}
%\usepackage{bm} % $\bm{letter}$ 数学式中粗斜体字母的最佳方案
%\usepackage{calc}
%\usepackage{units} %单位宏包

% ===========================字号===============================================
%\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}
%\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont}
%\newcommand{\yihao}{\fontsize{28pt}{\baselineskip}\selectfont}
%\newcommand{\erhao}{\fontsize{21pt}{\baselineskip}\selectfont}
%\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}
%\newcommand{\sanhao}{\fontsize{15.75pt}{\baselineskip}\selectfont}
%\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
%\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
%\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
%\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}
%\newcommand{\liuhao}{\fontsize{7.875pt}{\baselineskip}\selectfont}
%\newcommand{\qihao}{\fontsize{5.25pt}{\baselineskip}\selectfont}

% Liang Chao add
\usepackage{multirow} % for cmd 'multirow', 'multicolumn'
\usepackage{graphicx}
\usepackage{circuitikz}
\usepackage{quantikz}