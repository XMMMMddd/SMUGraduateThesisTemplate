% Copyright (C) 2010-2015 by Alwin Tsui <alwintsui@gmail.com>
% and Quansheng Guan <qshguan@gmail.com>
%
% This file is part of the scutthesis package project.
% https://github.com/alwintsui/scutthesis
% ---------------------------------------------------
% This file may be distributed and/or modified under the
% conditions of the GNU General Public License v3
% of this license or (at your option) any later version.
%
% modified from thuthesis.cls,seuthesis.cls and tjthesis.cls

%% Jun 19, 2010.参照现有国内各高校论文latex模板(东南，清华，北航等)，取其精华去其糟粕，写成初版
%% Jun 20, 2010,修改abstract,keywords,Appendence支持lyx的scutthesis.layout
%% Jun 22, 2010,用natbib来控制引用标的显示
%% v2.0.1, Mar 31, 2011,合并了Quansheng Guan部分修改,主要包含：草稿引入水印，加入定理环境，完善标题、表格和程序代码等格式
%% v2.1.0, Jun 20, 2015,启用pdfcover选项，修改代码区显示方式，附录页眉，去除草稿水印，lyx模板


\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{smuthesis}[2011/03/31 2.0.1 The LaTeX class for the thesis of Southern Medical University]

%% import global options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifmasterdegree\masterdegreefalse %默认为doctor
\newif\ifpdfcover\pdfcoverfalse
\newif\ifchapterx\chapterxfalse

\DeclareOption{master}{\masterdegreetrue}
\DeclareOption{pdfcover}{\pdfcovertrue} %using pdfcover,TOdo
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax %revised by Quansheng Guan \ProcessOptions
\LoadClass[12pt,a4paper,openany]{book}

%% define 几个宏
\newcommand{\scutthesis}{%
  S\hspace{-0.3ex}\raisebox{-0.5ex}{C}\hspace{-0.3ex}U\hspace{0.1em}\raisebox{-0.5ex}{T}%
  \textsc{Thesis}
}
\def \institute#1{\gdef\@institute{#1}}
\def \supervisor#1{\gdef\@supervisor{#1}}
\def \enauthor#1{\gdef\@enauthor{#1}}
\def \ensupervisor#1{\gdef\@ensupervisor{#1}}
\ifmasterdegree \newcommand{\@degree}{硕士} \else \newcommand{\@degree}{博士} \fi
\newcommand{\thesissubject}{南方医科大学\@degree{}学位论文}
\def\@classification{}
\def\@secret{}
\def\@UDC{}
\def\@studentnumber{}
\def\@englishtitle{}
\def\@enauthor{}
\def\@ensupervisor{}
\def\@grade{}
\def\@funding{}
\def\@major{}
\def\@trainingtype{}
\def\@degreelevel{\@degree}
\def\@location{广州}
\def\@submitdate{\@date}
\def\@titlepagedate{\@date}
\def\@defensechair{}
\def\@defensemembers{}
\def\@schoolnameimage{图片/image.png}
\def\@coverctitlea{}
\def\@coverctitleb{}
\def\@coveretitlea{}
\def\@coveretitleb{}
\def\@coveretitlec{}
\def\@titlectitlea{}
\def\@titlectitleb{}
\def\@titleetitlea{}
\def\@titleetitleb{}
\def\@titleetitlec{}
\def\@fundinga{}
\def\@fundingb{}
\def\smu@fronthead{}
\def \classification#1{\gdef\@classification{#1}}
\def \secret#1{\gdef\@secret{#1}}
\def \UDC#1{\gdef\@UDC{#1}}
\def \studentnumber#1{\gdef\@studentnumber{#1}}
\def \englishtitle#1{\gdef\@englishtitle{#1}}
\def \grade#1{\gdef\@grade{#1}}
\def \funding#1{\gdef\@funding{#1}}
\def \major#1{\gdef\@major{#1}}
\def \trainingtype#1{\gdef\@trainingtype{#1}}
\def \degreelevel#1{\gdef\@degreelevel{#1}}
\def \location#1{\gdef\@location{#1}}
\def \submitdate#1{\gdef\@submitdate{#1}}
\def \titlepagedate#1{\gdef\@titlepagedate{#1}}
\def \defensechair#1{\gdef\@defensechair{#1}}
\def \defensemembers#1{\gdef\@defensemembers{#1}}
\def \schoolnameimage#1{\gdef\@schoolnameimage{#1}}
\def \coverctitle#1#2{\gdef\@coverctitlea{#1}\gdef\@coverctitleb{#2}}
\def \coveretitle#1#2#3{\gdef\@coveretitlea{#1}\gdef\@coveretitleb{#2}\gdef\@coveretitlec{#3}}
\def \titlectitle#1#2{\gdef\@titlectitlea{#1}\gdef\@titlectitleb{#2}}
\def \titleetitle#1#2#3{\gdef\@titleetitlea{#1}\gdef\@titleetitleb{#2}\gdef\@titleetitlec{#3}}
\def \fundinglines#1#2{\gdef\@fundinga{#1}\gdef\@fundingb{#2}}
\def \smu@setfronthead#1{\gdef\smu@fronthead{#1}}
\newcommand{\smusetfronthead}[1]{\smu@setfronthead{#1}}
\renewcommand{\today}{\the\year~年~\the\month~月~\the\day~日}

%% 加载几个常用的sty packages
\RequirePackage{ifpdf}
\RequirePackage{ifthen}
% \RequirePackage{doc} % delete for Package hypdoc Warning: hyperref has been loaded before with option 'hyperindex' enabled.
\RequirePackage{keyval}
\RequirePackage{eso-pic}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{makeidx} % 索引
\RequirePackage{amsmath} 
\RequirePackage{mathrsfs}
\RequirePackage{amssymb} %this package conflicts with xeCJK, place it before xeCJK to avoid the coflict.
\RequirePackage[final]{pdfpages}
\RequirePackage{color}
\RequirePackage[no-math]{fontspec}
%\RequirePackage{prettyref} %不需要

%% 设置页面布局
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[left=3.175cm,right=3.175cm,bottom=2.54cm,top=2.54cm,%正文页边距
 headheight=0.5cm,%页眉高度
 headsep=0.5cm,%页眉到正文的距离
 footskip=0.5cm %正文底端到页码基线的距离
]{geometry}

%% 字体设置
%\RequirePackage[BoldFont, SlantFont,CJKnumber]{xeCJK} % xeCJK package, CJKnumber deprecated.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[BoldFont, SlantFont]{xeCJK} %CJKnumber已弃用
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\@ifpackagelater {xeCJK}  { 2008/12/29 }
\RequirePackage{zhnumber} %中文编号如第一章的"一"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\punctstyle{kaiming}
\setmainfont[Mapping=tex-text,Ligatures=NoCommon]{Times New Roman}%\rmfamily 使用的字体,默认英文和数字的字体。% setmainfont是 fontspec 宏包中的一个命令，用于设置 LaTeX 文档中的主字体（即英文部分的主要字体）。setmainfont 用于设置正文中的英文字体。它会影响所有非数学、非 CJK（中文、日文、韩文）字符的字体。

% 若对默认数学公式字体不满意，启用下面三条命令，否则注释掉（此时是采用久经验证可行的默认字体）。实际上就两条（引入unicode-math包并使用setmathfont命令设置字体）
% \usepackage{unicode-math} % 引入后一些符号仍需要amssymb和amsmath，但可以不需要mathrsfs。引入unicode-math后，很多符号，加粗的命令都变了，需要好好看包文档。
% \setmathfont{XITS Math}[math-style=ISO,bold-style=ISO] % 注释掉就是unicode-math默认的，和latex默认的也不同，具体看文档。
% \setmathfont{XITS Math}[range={cal, bfcal}, StylisticSet=1] %为解决花体问题引入。

\XeTeXlinebreaklocale "zh" %采用中文断行方式
\XeTeXlinebreakskip = 0pt plus 1pt %字元间可加入0pt~1pt 的弹性间距，这样才能排出左右对齐的段落。

%%------------for Windows----------------
%%\setCJKmainfont{SimSun}
%%\setCJKsansfont{SimSun}
%%\setCJKmonofont{SimSun}
%%\setCJKfamilyfont{song}{SimSun}
%%\setCJKfamilyfont{hei}{SimHei}
%%\setCJKfamilyfont{kai}{KaiTi_GB2312}
%%\setCJKfamilyfont{fang}{FangSong_GB2312}
%------------for mac----------------
\setCJKmainfont{Songti SC}%衬线字体
\setCJKsansfont{Heiti SC Light}%serif是有衬线字体sans serif无衬线字体。
\setCJKmonofont{STFangsong}%中文等宽字体
\setCJKfamilyfont{song}{Songti SC}
\setCJKfamilyfont{hei}{Heiti SC Light}
\setCJKfamilyfont{kai}[Path=/System/Library/AssetsV2/com_apple_MobileAsset_Font8/6331c5916c361af1b83fb8b8b76ef2eece20c8eb.asset/AssetData/]{Kai.ttf}
\setCJKfamilyfont{fang}{FangSong_GB2312}
\setCJKfamilyfont{coverhei}[FakeBold=2.4]{Heiti SC}
\setCJKfamilyfont{coverkai}[Path=/System/Library/AssetsV2/com_apple_MobileAsset_Font8/6331c5916c361af1b83fb8b8b76ef2eece20c8eb.asset/AssetData/,FakeBold=1.8]{Kai.ttf}
%---------------------------------------------

\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaiti}{\CJKfamily{kai}}
\newcommand{\fangsong}{\CJKfamily{fang}}
\newcommand{\coverheiti}{\CJKfamily{coverhei}}
\newcommand{\coverkaiti}{\CJKfamily{coverkai}}

% 很多字体字号并没有使用。第一个参数指定字号，第二个参数为baselineskip默认=1.2倍字号(pt). 结合\linespread可以实现控制行距。
% 但这里的设置暂时不清楚为什么，也暂时找不到其他方法。
% ToDo：使用更好的字体字号行距控制方法。例如用\usepackage{setspace}，然后\onehalfspacing实现单倍行距。但具体细节待考证。
%% Font size
\newcommand{\chuhao}{\fontsize{42pt}{46pt}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{40pt}\selectfont}
\newcommand{\yichu}{\fontsize{32pt}{36pt}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{32pt}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{24pt}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{20}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}
%\newcommand{\xiaosanhao}{\fontsize{15bp}{18pt plus .3pt minus .2pt}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{22.5pt}\selectfont}%1.5
\newcommand{\sihao}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{13pt}\selectfont} % change 10.95pt to 10.5pt, 真正的五号字应该是10.5。10.95是通常所说的11pt，在英文排版中使用。
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{7.5pt}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{6.5pt}\selectfont}

% 中文段首缩进
\newlength\CJK@twochars %set \CJK@twochars zero
\def\CJK@spaceChar{\hskip \f@size \p@}
%%\def\CJK@spaceChar{\Unicode{48}{7}} %delete
\def\CJKindent{%
    \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
    \parindent\CJK@twochars}
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}} % 中文破折号,added by Quansheng

% 报警处理
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%不要拉大行距使得页面充满
\raggedbottom
% 去掉页面中的badboxes报警，同上
% \setlength\parskip{.5\baselineskip
% 	plus .1\baselineskip
% 	minus .4\baselineskip
% }
\hbadness=10000 \tolerance=10000 \hfuzz=150pt % 去掉表格中的badboxes报警,看着不爽

% My fonts for Scut thesis字体字号设置，由于部分内容的字体使用默认设置，因此部分字体用不到。
\renewcommand{\normalsize}{\normalfont\songti\fontsize{12pt}{23.4pt}\selectfont} % 正文小四号宋体，23.4 磅行距
\newcommand{\absnamecn}{\heiti\xiaoerhao}         % 中文“摘要”字样的字体
\newcommand{\abskeycn}{\heiti\xiaosihao}       % 中文摘要“关键字”字样的字体
\newcommand{\abskeyscn}{\songti\xiaosihao\normalfont} % 中文摘要关键字的字体
\newcommand{\absnameen}{\heiti\xiaosihao}               % 英文``Abstract''字样的字体
\newcommand{\abskeyen}{\bfseries\xiaosihao}   % 英文``KEY WORDS''字样的字体
\newcommand{\abskeysen}{\songti\xiaosihao\normalfont}        % 英文关键字的字体
\newcommand{\headfont}{\normalfont\kaiti\wuhao} 	% 页眉字体：楷体五号
\newcommand{\smufooterfont}{\normalfont\xiaowuhao} % 页码字体：Times New Roman 小五
\newcommand{\toctitlefont}{\centering\normalfont\songti\bfseries\fontsize{15pt}{22.5pt}\selectfont} % “目录”字样：宋体加粗 15 磅
\newcommand{\tocchapterfont}{\normalfont\heiti\fontsize{14pt}{23.4pt}\selectfont} % 目录一级标题：黑体四号，23.4 磅行距
\newcommand{\tocsectionfont}{\normalfont\songti\fontsize{12pt}{23.4pt}\selectfont}         % 目录二级标题：小四，23.4 磅行距
\newcommand{\tocsubsectionfont}{\normalfont\songti\fontsize{12pt}{23.4pt}\selectfont}      % 目录三级标题：小四，23.4 磅行距
\newcommand{\tocsubsubsectionfont}{\normalfont\songti\fontsize{12pt}{23.4pt}\selectfont}      % 目录四级标题：小四，23.4 磅行距
\newcommand{\textchapterfont}{\centering\normalfont\songti\bfseries\fontsize{16pt}{24pt}\selectfont} % 正文一级标题：加粗宋体 16 磅，1.5 倍行距
\newcommand{\textsectionfont}{\normalfont\songti\bfseries\fontsize{14pt}{21pt}\selectfont}            % 正文二级标题：加粗宋体四号，1.5 倍行距
\newcommand{\textsubsectionfont}{\normalfont\songti\bfseries\fontsize{12pt}{18pt}\selectfont}     % 正文三级标题：加粗宋体小四，1.5 倍行距
\newcommand{\textsubsubsectionfont}{\heiti\xiaosihao}     % 正文上X.Y.Z.K小节的字体
\newcommand{\footnotefont}{\songti\xiaowuhao\normalfont}     % 脚注字体
\newcommand{\ftcaptionfont}{\songti\fontsize{10pt}{16pt}\selectfont\normalfont}         % 图表标题：10 磅宋体，16 磅行距

\newcommand{\reftitlefont}{\heiti\xiaoerhao}      % “参考文献”字样的字体
\newcommand{\refbodyfont}{\songti\wuhao\normalfont}          % 参考文献字体
\newcommand{\pubfont}{\songti\wuhao\normalfont}          % 《攻读博士/硕士学位期间取得的研究成果》字体，2022年更新。

\newcommand{\thanktitlefont}{\heiti\sanhao}    % “致谢”字样的字体
\newcommand{\appendixtitlefont}{\heiti\sanhao} % “附录”字样的字体
%\normalfont command (essentially) executes the command sequence:
%  \fontencoding{\encodingdefault}
%  \fontfamily{\familydefault}
%  \fontseries{\seriesdefault}
%  \fontshape{\shapedefault}
%  \selectfont



%% 图表环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%图题(由图号和图名组成)。图号为“图1-1”格式。图题置于图下，有图注或其他说明时应置于图题之上。
%表序与表名置于表上。
%图题和表题在lyx中插图或插表时，可以参照标题的位置，在上还是在下。

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png} % 如果插入的图片没有指定扩展名,那么依次搜索下面的扩展名所对应的文件
\RequirePackage{subfig} % config兼容subfigure命令
\RequirePackage{float} % 可以使用［H］命令
\RequirePackage{pdflscape} % 横向页面支持
\RequirePackage{caption} % 定义图的标题格式：居中. 使用caption3.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 根据子图引用显示，重定义部分参数  
\DeclareSubrefFormat{parens}{#1 #2)}
\DeclareSubrefFormat{subparens}{#2)}
\DeclareCaptionListOfFormat{parens}{#1 #2)}
\DeclareCaptionListOfFormat{subparens}{#2)}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareCaptionFont{capFont}{\ftcaptionfont} % 表格名及图名
\DeclareCaptionLabelSeparator{twospace}{~~}
\captionsetup{ labelsep=space,% 去掉图标签后的冒号 % 原模板labelsep=twospace，而论文撰写规范要求是space
  belowskip=0bp,aboveskip=0bp,
  font={capFont}, figurename=图,tablename=表,listfigurename=插图目录,listtablename=表格目录}
\captionsetup[figure]{position=bottom}
\makeatletter
\newcommand{\smucaptionbreak}{\protect\\[0.35em]}
\newcommand{\smuenglishcaptionlabelbytype}[1]{%
  \begingroup
    \edef\smu@captype{#1}%
    \def\smu@figure{figure}%
    \def\smu@table{table}%
    \def\smu@algocf{algocf}%
    \def\smu@algorithm{algorithm}%
    \ifx\smu@captype\smu@figure
      Figure~\thefigure
    \else\ifx\smu@captype\smu@table
      Table~\thetable
    \else\ifx\smu@captype\smu@algocf
      Algorithm~\@ifundefined{thealgocf}{\thealgorithm}{\thealgocf}%
    \else\ifx\smu@captype\smu@algorithm
      Algorithm~\thealgorithm
    \else
      \@nameuse{\smu@captype name}~\@nameuse{the\smu@captype}%
    \fi\fi\fi\fi
  \endgroup
}
\ProvideDocumentCommand{\smubicaption}{o m m}{%
  \IfNoValueTF{#1}{%
    \caption[#2]{#2\smucaptionbreak\textnormal{\smuenglishcaptionlabelbytype{\@captype}\quad #3}}%
  }{%
    \caption[#1]{#2\smucaptionbreak\textnormal{\smuenglishcaptionlabelbytype{\@captype}\quad #3}}%
  }%
}
\ProvideDocumentCommand{\smubicaptionof}{m o m m}{%
  \IfNoValueTF{#2}{%
    \captionof{#1}[#3]{#3\smucaptionbreak\textnormal{\smuenglishcaptionlabelbytype{#1}\quad #4}}%
  }{%
    \captionof{#1}[#2]{#3\smucaptionbreak\textnormal{\smuenglishcaptionlabelbytype{#1}\quad #4}}%
  }%
}
\newcommand{\FigureBicaption}[2]{\smubicaption{#1}{#2}}
\captionsetup[subfloat]{captionskip=6bp,nearskip=0bp,farskip=0bp,topadjust=0bp,
  justification=centering,labelformat=brace,labelsep=space,subrefformat=subparens,listofformat=parens}%要使分图题和图题一样字号，选项加上 font={capFont}

%%%%%%%%%%定义双标题命令
% 注释掉双语标题  
%\newcommand{\FigureBicaption}[2]{
%  \renewcommand{\figurename}{图}
%  \vspace{8pt}
%  \caption{#1}
%  \addtocounter{figure}{-1}
%  \renewcommand{\figurename}{Fig.}
%  \captionsetup{list=false}
%  \vspace{6pt}
%  \caption{#2}
%  \captionsetup{list=true}
%  \renewcommand{\figurename}{图}
%}
%\newcommand{\SubfloatCaption}[4]  % Two Parameters, the first one is the width of the subfigure,
%{
%  \subfloat[#2]{
%    \label{#3}
%    \addtocounter{subfigure}{-1}
%    \subfloat[\vspace{-5pt}#1]{#4}
%  }%
%}

%% 表格
\RequirePackage{array} % 扩展了 array 和 tabular 环境功能
\RequirePackage{booktabs} % 增加对三线表格的支持 % \toprule，\midrule，\bottomrule
\RequirePackage{longtable} % 长表格支持，截断跨页
%\RequirePackage{ctable, threeparttable} % 支持表格注释,复杂表格，一般用不上
%\RequirePackage{tabularx}
\captionsetup[table]{position=top}
%定义双标题命令
\newcommand{\TableBicaption}[2]{
  \smubicaption{#1}{#2}
}
% 算法环境，按需使用。
\usepackage{algorithm}
\usepackage{algorithmicx}
\usepackage{algpseudocode}
\renewcommand{\thealgorithm}{\thechapter-\arabic{algorithm}} % 算法编号格式
% --原版：
%\RequirePackage{algorithm}
%\RequirePackage{algpseudocode}
%% algorithm2e 中文标题定制
%\renewcommand{\algorithmicname}{算法}
%\renewcommand\thealgocf{\csname the\algocf@within\endcsname-\@arabic\c@algocf}%
%\renewcommand{\algorithmicrequire}{\textbf{Input:}}  % Use Input in the format of Algorithm
%\renewcommand{\algorithmicensure}{\textbf{Process:}} % Use Output in the format of Algorithm


\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\renewcommand{\thefootnote}{注\arabic{footnote}} \setcounter{footnote}{0}

\renewcommand\fps@figure{htbp} % 设置图浮动的默认参数
\renewcommand\fps@table{htbp}

\renewcommand{\textfraction}{0.07}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}

%% 列表
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 删除 itemize和 enumerate环境中 列表项之间的间隔，默认列表项之间的间距非常宽（超过1.5倍行距）
\def\@listi{%
  \leftmargin\leftmargini
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep}
\let\@listI\@listi
\@listi
\def\@listii{%
  \leftmargin\leftmarginii
  \labelwidth\leftmarginii
  \advance\labelwidth-\labelsep
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep}
\def\@listiii{%
  \leftmargin\leftmarginiii
  \labelwidth\leftmarginiii
  \advance\labelwidth-\labelsep
  \parsep 0pt%
  \topsep \parsep
  \itemsep \parsep
  \partopsep \p@ \@plus\z@ \@minus\p@}

%\RequirePackage{enumitem}
%\setlist{noitemsep,nolistsep,topsep=0pt,itemindent=1em}
%\setenumerate[1]{label=\arabic*), ref=\arabic*}
%\setenumerate[2]{label=\emph{\alph*}),ref=\theenumi.\emph{\alph*}}
%\setenumerate[3]{label=\roman*), ref=\theenumii.\roman*}
% Ref: http://bbs.ctex.org/viewthread.php?tid=52331&page=1
% \setitemize{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}
% \setenumerate{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}
% \setdescription{itemindent=38pt,leftmargin=0pt,itemsep=0ex,listparindent=26pt,partopsep=0pt,parsep=\parskip,topsep=-0.25ex}

% \RequirePackage{paralist}% 修改列表格式
% \setdefaultenum{1)}{a)}{i.}{A.}% 设置列表模式,for \enumerate
% \setdefaultleftmargin{4ex}{}{}{}{}{}%standard \itemize :• – ∗ ·

%\RequirePackage[numbers,super,square,sort&compress]{natbib}  %改biblatex
% 用natbib代替下面的一些设置
%\let\originalcite=\cite
%\renewcommand{\cite}[1]{\textsuperscript{\originalcite{#1}}}
%\renewcommand{\citet}[1]{\originalcite{#1}}

%% 程序代码格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage[ruled,vlined,algochapter]{algorithm2e}



\RequirePackage{listings}
\definecolor{mygray}{RGB}{245,245,245}
\lstset{
  tabsize=4, %
  frame=tb,
  commentstyle=\color{red!50!green!50!blue!50},
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries,
  backgroundcolor=\color{mygray},
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily,
  basicstyle={\footnotesize\ttfamily},
  breaklines=true,
  keepspaces=true, %
  flexiblecolumns=true, %
  lineskip=-0.1pt,%行距
  fontadjust,
  captionpos=t,
  framextopmargin=1pt,framexbottommargin=1pt,abovecaptionskip=-1pt,belowcaptionskip=1pt,
  %xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
 extendedchars=false,columns=flexible,mathescape=false
  breakautoindent=true
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头 added by Guan

%%%%%%%%%%%%%%%%%%%%--2022-2-26更新--%%%%%%%%%%%%%%%%%%%%%%%%%%
%---ref: https://blog.csdn.net/youyagaozitai/article/details/70210297?%3E
% 增加目录的项目——tocbibind
%正文区写 \tableofcontents %输出目录命令，输出内容是正文中/section等的内容。 
%若在目录中显示其他条目，使用：  
\RequirePackage[nottoc]{tocbibind} %增加目录项目，tocbibind宏包会自动加入目录项本身、参考文献、索引等项目。[nottoc]取消了对自身的显示

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bibname}{参考文献}
\renewcommand{\appendixname}{附录}

\AtBeginDocument{%
  \@ifpackageloaded{biblatex}{%
    \setlength{\bibitemsep}{0pt}%
    \setlength{\bibparsep}{0pt}%
    \setlength{\biblabelsep}{0.8em}%
    \renewcommand*{\bibfont}{\linespread{1}\refbodyfont}%
    \renewcommand*{\multicitedelim}{\addcomma}%
    \newbibmacro*{smu:cite:plain}{%
      \printtext[bibhyperref]{%
        \printfield{labelprefix}%
        \printfield{labelnumber}%
        \ifbool{bbx:subentry}{\printfield{entrysetcount}}{}}}%
    \DeclareCiteCommand{\cite}[\mkbibsuperscript]%
      {\mkbibleftborder\usebibmacro{prenote}}%
      {\usebibmacro{citeindex}\usebibmacro{smu:cite:plain}}%
      {\multicitedelim}%
      {\mkbibrightborder\printfield{postnote}}%
    \DeclareCiteCommand{\citep}[\mkbibsuperscript]%
      {\mkbibleftborder\usebibmacro{prenote}}%
      {\usebibmacro{citeindex}\usebibmacro{smu:cite:plain}}%
      {\multicitedelim}%
      {\mkbibrightborder\printfield{postnote}}%
    \DeclareCiteCommand{\autocite}[\mkbibsuperscript]%
      {\mkbibleftborder\usebibmacro{prenote}}%
      {\usebibmacro{citeindex}\usebibmacro{smu:cite:plain}}%
      {\multicitedelim}%
      {\mkbibrightborder\printfield{postnote}}%
    \let\upcite\cite
    \defbibheading{smubibliography}[\bibname]{%
      \clearpage
      \smu@setfronthead{#1}%
      \chapter*{#1}%
      \addcontentsline{toc}{chapter}{#1}%
    }%
  }{}%
}

% 设置目录
%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
%\renewcommand\contentsname{\centerline{\toctitlefont{目\quad{}录}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\contentsname}{目\texorpdfstring{\quad}{}录}	%中文目录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titlecontents{chapter}[0ex]{\tocchapterfont}{%
    第\zhnumber{\thecontentslabel}章\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}{\tocchapterfont\contentspage}}%
\titlecontents{section}[1em]{\tocsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}{\tocsectionfont\contentspage}}%
\titlecontents{subsection}[2em]{\tocsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}{\tocsubsectionfont\contentspage}}%
\titlecontents{subsubsection}[3em]{\tocsubsubsectionfont}{%
    \thecontentslabel\quad{}}{}{%
    \hspace{.5em}\titlerule*[5pt]{$\cdot$}{\tocsubsubsectionfont\contentspage}}%

% 设定章节深度和目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

% Text style
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[pagestyles, rm]{titlesec}%调用titlesec涵盖fancyhdr的功能
\renewcommand{\chaptername}{第\zhnumber{\thechapter}章}
\titleformat{\chapter}[block]{\textchapterfont}{第\zhnumber{\thechapter}章}{1em}{}
\titleformat{\section}[hang]{\textsectionfont}{\thesection}{1em}{}
\titleformat{\subsection}[hang]{\textsubsectionfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]{\textsubsubsectionfont}{\thesubsubsection}{1ex}{}% 小四黑体居左

%\titlespacing{\chapter}{0pt}{3ex plus .5ex minus .5ex}{3ex plus .5ex minus .5ex} % 缩短章节标题的上边距
\setlength{\parskip}{0ex}% 正文段前段后距：无空行
\titlespacing{\chapter}{0pt}{12pt}{12pt} % 一级标题：段前/段后 12 磅
\titlespacing{\section}{0pt}{12pt}{12pt}  % 二级标题：段前/段后 12 磅
\titlespacing{\subsection}{0pt}{7.8pt}{7.8pt} % 三级标题：段前/段后 7.8 磅
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}

\newcommand{\linespacing}[1]{\linespread{#1}\selectfont}% 行距命令


%\renewcommand\backmatter{%
%  % there is no label number for reference chapter
%}
%==========
\AtBeginDocument{\CJKindent{}%
    \makeindex%
    \normalsize%正文字体格式
    \linespacing{1}%
    \setlength{\parindent}{2em}%
    \setlength{\leftskip}{0pt}%
    \setlength{\rightskip}{0pt}%
    \color{black}%
  }
\AtEndDocument{}

%------------------
\newcommand{\smu@coverfield}[2]{%
  \makebox[3.2cm][s]{#1}\quad\makebox[5.5cm][c]{#2}\par}
\newcommand{\smu@coverid}[2]{%
  \makebox[1.8cm][l]{#1}\hspace{0.25cm}\underline{\makebox[4cm][c]{#2}}}
\newcommand{\smu@covercnone}{\ifx\@coverctitlea\@empty\@title\else\@coverctitlea\fi}
\newcommand{\smu@covercntwo}{\@coverctitleb}
\newcommand{\smu@coverenone}{\ifx\@coveretitlea\@empty\@englishtitle\else\@coveretitlea\fi}
\newcommand{\smu@coverentwo}{\@coveretitleb}
\newcommand{\smu@coverenthree}{\@coveretitlec}
\newcommand{\smu@titlecnone}{\ifx\@titlectitlea\@empty\smu@covercnone\else\@titlectitlea\fi}
\newcommand{\smu@titlecntwo}{\ifx\@titlectitleb\@empty\smu@covercntwo\else\@titlectitleb\fi}
\newcommand{\smu@titleenone}{\ifx\@titleetitlea\@empty\smu@coverenone\else\@titleetitlea\fi}
\newcommand{\smu@titleentwo}{\ifx\@titleetitleb\@empty\smu@coverentwo\else\@titleetitleb\fi}
\newcommand{\smu@titleenthree}{\ifx\@titleetitlec\@empty\smu@coverenthree\else\@titleetitlec\fi}
\newcommand{\smu@titlefundingone}{\ifx\@fundinga\@empty\@funding\else\@fundinga\fi}
\newcommand{\smu@titlefundingtwo}{\@fundingb}
\newcommand{\smu@coverunderlinerow}[2]{%
  \noindent\makebox[\textwidth][c]{#1 #2}\par
  \vspace{-0.2em}
  \noindent\makebox[\textwidth][c]{\rule{0.90\textwidth}{0.8pt}}\par
  \vspace{0.18em}}
\newcommand{\smu@coverctitleblock}{%
  \smu@coverunderlinerow{}{\smu@covercnone}%
  \ifx\@coverctitleb\@empty\else
    \smu@coverunderlinerow{}{\@coverctitleb}%
  \fi}
\newcommand{\smu@coveretitleblock}{%
  \smu@coverunderlinerow{}{\smu@coverenone}%
  \ifx\@coveretitleb\@empty\else
    \smu@coverunderlinerow{}{\@coveretitleb}%
  \fi
  \ifx\@coveretitlec\@empty\else
    \smu@coverunderlinerow{}{\@coveretitlec}%
  \fi}
\newcommand{\smu@titlectitleblock}{%
  \put(0,200){\makebox(146,0)[c]{\coverheiti\bfseries\sanhao \smu@titlecnone}}%
  \ifx\@titlectitleb\@empty
    \ifx\@coverctitleb\@empty\else
      \put(0,186){\makebox(146,0)[c]{\coverheiti\bfseries\sanhao \@coverctitleb}}%
    \fi
  \else
    \put(0,186){\makebox(146,0)[c]{\coverheiti\bfseries\sanhao \@titlectitleb}}%
  \fi}
\newcommand{\smu@titleetitleblock}{%
  \put(0,173){\makebox(146,0)[c]{\bfseries\sanhao \smu@titleenone}}%
  \ifx\@titleetitleb\@empty
    \ifx\@coveretitleb\@empty\else
      \put(0,161){\makebox(146,0)[c]{\bfseries\sanhao \@coveretitleb}}%
    \fi
  \else
    \put(0,161){\makebox(146,0)[c]{\bfseries\sanhao \@titleetitleb}}%
  \fi
  \ifx\@titleetitlec\@empty
    \ifx\@coveretitlec\@empty\else
      \put(0,149){\makebox(146,0)[c]{\bfseries\sanhao \@coveretitlec}}%
    \fi
  \else
    \put(0,149){\makebox(146,0)[c]{\bfseries\sanhao \@titleetitlec}}%
  \fi}
\newcommand{\smu@coverdegree}{%
  \ifmasterdegree
    硕\hspace{0.85em}士\hspace{0.85em}学\hspace{0.85em}位\hspace{0.85em}论\hspace{0.85em}文%
  \else
    博\hspace{0.85em}士\hspace{0.85em}学\hspace{0.85em}位\hspace{0.85em}论\hspace{0.85em}文%
  \fi}
\newcommand{\smu@coverinfoitem}[2]{%
  \makebox[3.2cm][s]{#1} & \underline{\makebox[9.4cm][c]{#2}}\\[1.0em]}
\newcommand{\smu@infoitem}[2]{%
  \makebox[\linewidth][s]{#1} & #2\\[0.45em]}
\newcommand{\smu@titleitem}[2]{%
  \makebox[\linewidth][s]{#1} & #2\\[0.55em]}
\newcommand{\smu@titleabsitem}[3]{%
  \put(38,#1){\makebox[38mm][s]{#2}}%
  \put(81,#1){\makebox[62mm][l]{#3}}}
\newcommand{\smu@titlefundingitem}[3]{%
  \put(0,#1){\makebox[29mm][l]{#2}}%
  \put(29,#1){\makebox[117mm][l]{#3}}}

\renewcommand{\maketitle}{% called outside
  \ifpdfcover
    %%coverpage from pdf file
    \includepdf[pages={1-5,{},7-8}]{cover_file/thesis_cover.pdf}
  \else
    %% Built-in cover page.
    \newgeometry{left=3.2cm,right=3.2cm,bottom=3.8cm,top=3.8cm,headheight=1.5cm,headsep=0.8cm,footskip=0.8cm}
    \clearpage
    \begingroup
      \pagestyle{empty}
      \thispagestyle{empty}
      \linespacing{1}
      \begin{center}
        \vspace*{-0.4cm}
        {\coverheiti\bfseries\sanhao
        \begin{tabular}{@{}l@{\hspace{1cm}}l@{}}
          \smu@coverid{分\ 类\ 号}{\@classification} &
          \smu@coverid{密\ 级}{\@secret}\\[1.1em]
          \smu@coverid{U\ D\ C}{\@UDC} &
          \smu@coverid{编\ 号}{\@studentnumber}
        \end{tabular}}

        \vspace{1.05cm}
        \IfFileExists{\@schoolnameimage}
          {\includegraphics[width=0.70\textwidth]{\@schoolnameimage}\par}
          {{\kaiti\fontsize{48pt}{58pt}\selectfont 南方医科大学\par}}

        \vspace{0.55cm}
        {\coverkaiti\bfseries\yihao \smu@coverdegree\par}

        \vspace{1.2cm}
        {\coverheiti\bfseries\xiaoerhao
          \smu@coverctitleblock}

        \vspace{0.05cm}
        {\bfseries\xiaoerhao
          \smu@coveretitleblock}

        \vspace{1.25cm}
        {\coverheiti\bfseries\sanhao\underline{\makebox[4.8cm][c]{\@author}}\par}

        \vspace{0.9cm}
        {\coverheiti\bfseries\xiaosihao
        \begin{tabular}{@{}>{\coverheiti}p{3.25cm}@{}l@{}}
          \smu@coverinfoitem{导师姓名}{\@supervisor}
          \smu@coverinfoitem{专业名称}{\@major}
          \smu@coverinfoitem{培养类型}{\@trainingtype}
          \smu@coverinfoitem{论文提交日期}{\@submitdate}
        \end{tabular}}
      \end{center}
      \clearpage
    \endgroup

    %% Built-in title page.
    \newgeometry{left=3.2cm,right=3.2cm,bottom=3.8cm,top=3.8cm,headheight=1.5cm,headsep=0.8cm,footskip=0.8cm}
    \begingroup
      \pagestyle{empty}
      \thispagestyle{empty}
      \linespacing{1}
      \setlength{\unitlength}{1mm}
      \noindent\begin{picture}(146,221)
        \put(0,218){\makebox(146,0)[c]{\songti\xiaosihao 南方医科大学\ \@grade\@degree{}学位论文}}

        \smu@titlectitleblock
        \smu@titleetitleblock

        {\kaiti\sihao
          \smu@titlefundingitem{133}{课题来源：}{\smu@titlefundingone}
          \smu@titlefundingitem{123}{\phantom{课题来源：}}{\smu@titlefundingtwo}
        }

        {\kaiti\sihao
          \smu@titleabsitem{113}{学位申请人}{\@author}
          \smu@titleabsitem{104}{导师姓名}{\@supervisor}
          \smu@titleabsitem{95}{专业名称}{\@major}
          \smu@titleabsitem{86}{培养类型}{\@trainingtype}
          \smu@titleabsitem{77}{培养层次}{\@degreelevel}
          \smu@titleabsitem{68}{所在学院}{\@institute}

          \smu@titleabsitem{54}{答辩委员会主席}{\@defensechair}
          \put(38,43){\makebox[38mm][s]{答辩委员会成员}}
          \put(81,43){\renewcommand{\arraystretch}{1.2}\begin{tabular}[t]{@{}l@{}}\@defensemembers\end{tabular}}
        }

        \put(0,6){\makebox(146,0)[c]{\kaiti\sanhao \@titlepagedate\quad \@location}}
      \end{picture}
      \clearpage
    \endgroup
    \restoregeometry
  \fi
}

\newcommand{\smu@blankfield}[1]{\makebox[#1]{}}
\newcommand{\smu@checkbox}{\kern0bp{\fontspec{FangSong_GB2312}\char"25A1}}
\newcommand{\makecopyrightpage}{%
  \clearpage
  \thispagestyle{smucopyrightstyle}%
  \begingroup
    \fangsong
    \fontsize{11bp}{23.04bp}\selectfont
    \setlength{\parindent}{24bp}%
    \setlength{\parskip}{0pt}%
    \vspace*{0.54cm}%
    \noindent\begin{minipage}{\textwidth}
      \raggedright
      \setlength{\parindent}{24bp}%
      {\centering\songti\bfseries\fontsize{18bp}{23.04bp}\selectfont
        \hspace*{1.124bp}南方医科大学学位论文原创性声明\par}
      \vspace{21.87bp}

      本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所取得的研究成果。除了文中特别加以标注引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写的成果作品。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。除与外单位合作项目将予以明确方式规定外，本研究已发表与未发表成果的知识产权均归属南方医科大学。\par
      本人承诺承担本声明的法律效果。\par
      \vspace{22.8bp}
      作者签名：\smu@blankfield{88bp}日期：\smu@blankfield{22bp}年\smu@blankfield{16.5bp}月\smu@blankfield{16.5bp}日\par

      \vspace{70.05bp}
      {\centering\songti\bfseries\fontsize{18bp}{23.04bp}\selectfont
        \hspace*{1.124bp}学位论文版权使用授权书\par}
      \vspace{21.87bp}

      本学位论文作者完全了解学校有关保留、使用学位论文的规定，同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权南方医科大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。\par
      \vspace{22.8bp}
      本学位论文属于（请在以下相应方框内打“√”）：\par
      \noindent\hspace*{101bp}1、保密\smu@checkbox{}，在\rule[-1.5bp]{16.5bp}{0.4bp}年解密后适用本授权书。\par
      \noindent\hspace*{99bp}2、不保密\smu@checkbox{}。\par
      \vspace{23.04bp}
      作者签名：\smu@blankfield{88bp}日期：\smu@blankfield{22bp}年\smu@blankfield{16.5bp}月\smu@blankfield{16.5bp}日\par
      导师签名：\smu@blankfield{88bp}日期：\smu@blankfield{22bp}年\smu@blankfield{16.5bp}月\smu@blankfield{16.5bp}日
    \end{minipage}%
  \endgroup
  \clearpage
}

%%摘要分中英文页，而且有两者排版方式：
%一种是采用\abstractCN和\abstractEN方式以“摘要”和“Abstract”为页标题
%另一种采用研究报告的标题为摘要页的标题，这时使用\charpter*{报告中文或英文标题}和\chapterx{摘要或Abstract}
%\newenvironment{abstractCN}{
%  \chapter*{摘\quad 要}
%
%  \addcontentsline{toc}{chapter}{摘要}
%}{}
%
%\newenvironment{abstractEN}
%{
%  \chapter*{Abstract}
%  \addcontentsline{toc}{chapter}{Abstract}
%}{}

\newcommand{\keywordsCN}[1]{
  \par
 \vspace{1em}
  \newcommand{\@keywords}{#1}
  {\noindent\abskeycn 关键词：} {\abskeyscn \@keywords} % \noindent去掉缩进
}
\newcommand{\keywordsEN}[1]{
  \par
 \vspace{1em}
  {\noindent\abskeyen Keywords:} {\abskeysen #1} % \noindent去掉缩进
}
\newcommand{\makeabstractCNhead}{%
  \clearpage
  \smu@setfronthead{摘\quad 要}%
  \thispagestyle{smuthesisstyle}%
  \ifx\phantomsection\@undefined\else\phantomsection\fi
  \addcontentsline{toc}{chapter}{摘\texorpdfstring{\quad}{}要}%
  \begingroup
    \linespacing{1}%
    \centering
    \vspace*{-0.5cm}
    {\coverheiti\bfseries\erhao \smu@covercnone\par}
    \vspace{0.15cm}
    {\coverheiti\bfseries\erhao \smu@covercntwo\par}
    \vspace{0.55cm}
    {\coverheiti\bfseries\sanhao \@degree{}研究生：\quad\@author\par}
    \vspace{0.45cm}
    {\coverheiti\bfseries\sanhao 指导教师：\quad\@supervisor\par}
    \vspace{0.75cm}
    {\coverheiti\bfseries\sanhao 摘\quad 要\par}
    \vspace{0.9cm}
  \endgroup
  \noindent
}
\newcommand{\makeabstractENhead}{%
  \clearpage
  \pagenumbering{roman}% 英文摘要重新从小写罗马页码开始
  \smu@setfronthead{ABSTRACT}%
  \thispagestyle{smuthesisstyle}%
  \ifx\phantomsection\@undefined\else\phantomsection\fi
  \addcontentsline{toc}{chapter}{ABSTRACT}%
  \begingroup
    \linespacing{1}%
    \centering
    \vspace*{-0.5cm}
    {\bfseries\erhao\parbox{\textwidth}{\centering\@englishtitle}\par}
    \vspace{0.55cm}
    {\bfseries\sanhao Graduate Student:\quad\@enauthor\par}
    \vspace{0.45cm}
    {\bfseries\sanhao Supervisor:\quad\@ensupervisor\par}
    \vspace{0.75cm}
    {\bfseries\sanhao ABSTRACT\par}
    \vspace{0.9cm}
  \endgroup
  \noindent
}
%
\newcommand{\abstractx}[1]
{
 \begin{center}
  #1
 \par\end{center}
  \addcontentsline{toc}{chapter}{#1}
}

%有些章节名如“致谢”、“附录”，无需章节编号，相当于chapter*，但需要把章节名加入目录，相应的页眉也要改动
%通过\chapterx和\chapterxname来完成。
%\def \chapterxname#1{\gdef\@chapterxname{#1}}
%\newcommand{\chapterx}[1]
%{
%  \chapterxtrue
%  \chapter*{#1}
%  \chapterxname{#1}
%  \addcontentsline{toc}{chapter}{#1}
%}

%\renewcommand{\appendix}[1]{%
%  % \chaptertitle is not available for those chapters without label number.
%   \cleardoublepage
%   \renewcommand{\thesection}{{#1}\arabic{section}}
%   \chapter*{#1}
%   \chapterxname{\thesection\quad\sectiontitle}
%   \addcontentsline{toc}{chapter}{#1}
%   \setcounter{section}{0}
%}

%\renewenvironment{verse}
%               {\let\\\@centercr
%                \list{}{\itemsep      \z@
%                        \itemindent   -1.5em%
%                        \listparindent\itemindent
%                        \rightmargin  \leftmargin
%                        \advance\leftmargin 1.5em}%
%                \item\relax}
%               {\endlist}
%\renewenvironment{quotation}
%               {\list{}{\listparindent 1.5em%
%                        \itemindent    \listparindent
%                        \rightmargin   \leftmargin
%                        \parsep        \z@ \@plus\p@}%
%                \item\relax}
%               {\endlist}
%\renewenvironment{quote}
%               {\list{}{\rightmargin\leftmargin}%\vspace{-15pt}
%                \item\relax}
%               {\endlist}


%\sethead[ even-left ][ even-center ][ even-right ]    { odd-left }{ odd-center }{ odd-right }
\newpagestyle{smuthesisstyle}{
  \sethead[][{\headfont{}\if@mainmatter\chaptertitlename\quad\chaptertitle\else\smu@fronthead\fi}][]% 偶数页：章节名/前置部分标题
  {}{{\headfont{}\@degree{}学位论文}}{}% 奇数页：学位论文类型
  \setfoot[][\smufooterfont{}\thepage][]% 偶数页页码居中
  {}{\smufooterfont{}\thepage}{}% 奇数页页码居中
  \headrule
  \setheadrule{0.75pt}
}

% 原创性声明页：按学校 Word 模板使用固定页眉和底部居中页码。
\newpagestyle{smucopyrightstyle}{
  \sethead[][\headfont{}南方医科大学学位论文原创性声明][]%
  {}{\headfont{}\@degree{}学位论文}{}%
  \setfoot[][\smufooterfont{}\thepage][]%
  {}{\smufooterfont{}\thepage}{}%
  \headrule
  \setheadrule{0.75pt}
}

\newpagestyle{smutocstyle}{
  \sethead[][{\headfont{}\smu@fronthead}][]% 偶数页：目录
  {}{{\headfont{}\@degree{}学位论文}}{}% 奇数页：学位论文类型
  \setfoot[][][]{}{}{}% 目录页底部不显示页码
  \headrule
  \setheadrule{0.75pt}
}

\newpagestyle{smulandscapestyle}{%
  \sethead[][][]{}{}{}%
  \setfoot[][][]{}{}{}%
  \setheadrule{0pt}%
}
\newlength{\smu@landscapeheadwidth}
\setlength{\smu@landscapeheadwidth}{\dimexpr\paperheight-6.35cm\relax}
\newcommand{\smu@landscapeevenheadtext}{%
  \if@mainmatter\chaptertitlename\quad\chaptertitle\else\smu@fronthead\fi}
\newcommand{\smu@landscapeheadtext}{%
  \ifodd\c@page\@degree{}学位论文\else\smu@landscapeevenheadtext\fi}
\newcommand{\smu@landscapeoverlay}{%
  \AtPageLowerLeft{%
    \put(\LenToUnit{1.7cm},\LenToUnit{0.5\paperheight}){%
      \makebox(0,0){%
        \rotatebox{90}{%
          \parbox{\smu@landscapeheadwidth}{%
            \centering\headfont\smu@landscapeheadtext\\[-0.35em]%
            \rule{\linewidth}{0.75pt}}}}}%
    \put(\LenToUnit{\dimexpr\paperwidth-2.1cm\relax},\LenToUnit{0.5\paperheight}){%
      \makebox(0,0){\rotatebox{90}{\smufooterfont\thepage}}%
    }%
  }%
}
\newenvironment{smulandscape}{%
  \newgeometry{left=2.54cm,right=2.54cm,bottom=3.175cm,top=3.175cm,headheight=0.5cm,headsep=0.5cm,footskip=0.5cm}%
  \begin{landscape}%
  % Align longtable captions with the narrowest landscape table rule.
  \setlength{\LTcapwidth}{21.5cm}%
  \pagestyle{smulandscapestyle}%
  \thispagestyle{smulandscapestyle}%
  \AddToShipoutPictureFG{\smu@landscapeoverlay}%
}{%
  \end{landscape}%
  \ClearShipoutPictureFG%
  \restoregeometry%
  \pagestyle{smuthesisstyle}%
}

\let\smu@orig@tableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
  \clearpage
  \restoregeometry
  \smu@setfronthead{\contentsname}%
  \begingroup
    \let\textchapterfont\toctitlefont
    \titlespacing{\chapter}{0pt}{0pt}{12pt}%
    \let\ps@plain=\ps@smutocstyle
    \pagestyle{smutocstyle}%
    \smu@orig@tableofcontents
    \clearpage
  \endgroup
  \pagestyle{smuthesisstyle}}

%\let\orig@bibliography=\bibliography
%\renewcommand{\bibliography}[1]{
%	\cleardoublepage % 使参考文献使用 seunolabel 页面样式
%	\refbodyfont
%        \chapterxtrue % 改变页眉标题方式
%        \chapterxname{\bibname}
%	\let\ps@plain=\ps@revtitlestyle
%	\pagestyle{revtitlestyle} % here and continue
%	\orig@bibliography{#1}
%	\normalsize
%}

\renewcommand\frontmatter{ %标题之后，开始中英文摘要，目录
		\clearpage
    \newgeometry{left=3.2cm,right=3.2cm,bottom=3.8cm,top=3.8cm,headheight=0.5cm,headsep=0.5cm,footskip=0.5cm}
    \let\ps@plain=\ps@smuthesisstyle
    \pagestyle{smuthesisstyle}
    \pagenumbering{Roman}% 中文摘要使用大写罗马页码
    \@mainmatterfalse
}

\renewcommand\mainmatter{%
  \clearpage
  \restoregeometry
  \@mainmattertrue
  \pagenumbering{arabic}
  \let\ps@plain=\ps@smuthesisstyle
  \pagestyle{smuthesisstyle}
}
%\RequirePackage{fancyhdr}







%%定理环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \RequirePackage{bm} % 数学符号粗体 % 引入unicode-math后不再需要。若不使用unicode-math，boldsymbol命令也没法加粗，则可考虑借助bm包。
%\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{amsthm}
%允许公式换页显示,否则大型推导公式都在一页内，
%一页显示不下放到第二页，导致很大的空白空间，很不好看
\allowdisplaybreaks[4]
%\setlength\jot{1pt} %公式之间的距离,TODO


\newtheoremstyle{definition}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{definition}
\newtheorem{definition}{定义~}[chapter]
\newtheorem{example}{例~}[chapter]
\newtheorem{remark}{注~}[chapter]
\newtheorem{assumption}{假设~}[chapter]	%  
% ------改为definition 
\newtheorem{proposition}{命题~}[chapter]
\newtheorem{lemma}{引理~}[chapter]
\newtheorem{theorem}{定理~}[chapter]
\newtheorem{axiom}{公理~}[chapter]
\newtheorem{corollary}{ 推论~}[chapter]
\newtheorem{case}{情形~}[chapter]
\newtheorem{conjecture}{猜想~}[chapter]
\newtheorem{property}{性质~}[chapter]
% ----------

%% 可继续用\newtheorem命令添加需要的环境

\newtheoremstyle{plain}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {\itshape}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
% -------------------根据2022年博士论文送审反馈意见，下面部分改为正体，故移到definition 
% \newtheorem{proposition}{命题~}[chapter]
% \newtheorem{lemma}{引理~}[chapter]
% \newtheorem{theorem}{定理~}[chapter]
% \newtheorem{axiom}{公理~}[chapter]
% \newtheorem{corollary}{ 推论~}[chapter]
% \newtheorem{case}{情形~}[chapter]
% \newtheorem{conjecture}{猜想~}[chapter]
% \newtheorem{property}{性质~}[chapter]
%% 可继续用\newtheorem命令添加需要的环境
% ------------

\renewenvironment{proof}{\vskip 1pt\indent  证明:~\normalfont}{\hfill$\square$\vskip 0.01\baselineskip} %$\blacksquare$ -----去掉\itshape 该命令用于设置斜体


%\renewcommand{\proofname}{\hskip 2em 证明:~} %
%%%%%%%%%%%%%%%%%   end of 定理环境

% 公式和正文的间距由4pt改为10pt，更美观
\abovedisplayshortskip=10pt
\belowdisplayshortskip=10pt
\abovedisplayskip=10pt
\belowdisplayskip=10pt

\endinput
%% End of file `scutthesis.cls'.
