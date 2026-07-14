# 南方医科大学研究生毕业论文 LaTeX 模板

这是一个非官方的南方医科大学研究生毕业论文 LaTeX 模板，用于硕士、博士学位论文排版。模板目前按本仓库示例论文调试，最终格式仍应以学校或学院发布的最新要求为准。

## 文件说明

- `毕业论文_smuthesis.tex`：论文主文件示例，包含封面信息、摘要、正文、参考文献、致谢、附录和版权页的基本结构。
- `smuthesis.cls`：模板类文件，定义封面、标题页、字体、章节标题、页眉页脚、图表标题、横向页面和版权页。
- `mybib.bib`：参考文献数据库示例。
- `图片/image.png`：封面使用的“南方医科大学”校名字图。
- `skills/smu-thesis-writing`：可选的 Codex Skill，用于审核中文论文写作、术语、公式和 Word/LaTeX 版式一致性。

## 主要特性

- 支持硕士/博士论文：`\documentclass[master]{smuthesis}` 为硕士，不加 `master` 默认为博士。
- 支持草稿模式：`\documentclass[master,draft]{smuthesis}`。
- 封面和题名页支持中文 1-2 行、英文 1-3 行手动分行。
- 正文小四号宋体、1.5 倍行距；一、二、三级标题为加粗宋体。
- `biblatex + biber` 数字顺序制引用，正文引用显示为上标方括号，如 `[1]`。
- 图表支持中英文双语 caption，英文行自动显示 `Figure 1-1` / `Table 1-1`。
- 横向页面使用 `smulandscape` 环境，页眉和页码会随页面横向旋转。
- 参考文献、致谢、附录等无编号章节可用 `\smusetfronthead{...}` 设置偶数页页眉。
- 内置原创性声明和论文版权使用授权书：`\makecopyrightpage`。

## 快速开始

1. 安装 TeX Live 或 MacTeX，并使用 XeLaTeX 编译。

2. 修改 `毕业论文_smuthesis.tex` 中的论文信息：

   ```tex
   \title{论文标题}
   \englishtitle{English Thesis Title}
   \coverctitle{中文题名第一行}{中文题名第二行}
   \coveretitle{English title line one}{English title line two}{English title line three}
   \titlectitle{题名页中文题名第一行}{题名页中文题名第二行}
   \titleetitle{Title page English line one}{Title page English line two}{Title page English line three}
   \schoolnameimage{图片/image.png}
   \author{作者姓名}
   \supervisor{导师姓名\quad 教授}
   \institute{学院名称}
   \grade{2026级}
   \major{专业名称}
   \trainingtype{学术型}
   \degreelevel{硕士}
   \funding{课题来源}
   \fundinglines{课题来源第一行}{课题来源第二行}
   \submitdate{2026年6月}
   \titlepagedate{2026年6月}
   \location{广州}
   \defensechair{主席姓名\quad 教授}
   \defensemembers{委员一\quad 教授\\委员二\quad 教授}
   \date{2026年6月}
   ```

3. 编译：

   ```bash
   xelatex 毕业论文_smuthesis.tex
   biber 毕业论文_smuthesis
   xelatex 毕业论文_smuthesis.tex
   xelatex 毕业论文_smuthesis.tex
   ```

## 常用写法

### 参考文献

模板示例使用 `biblatex`、`biber` 和 `gb7714-2015`：

```tex
\usepackage[
  backend=biber,
  style=gb7714-2015,
  sorting=none,
  gbcitecomp=false,
  gbnamefmt=lowercase,
  doi=false,
  url=false,
  isbn=false
]{biblatex}
\addbibresource{mybib.bib}
```

正文使用 `\cite{key}`、`\citep{key}` 或 `\autocite{key}`。参考文献列表写作：

```tex
\printbibliography[heading=smubibliography,title={参考文献}]
```

### 双语图表标题

普通图表推荐使用：

```tex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{图片/example.pdf}
  \smubicaption{中文图题}{English caption}
  \label{fig:example}
\end{figure}
```

表格同样使用 `\smubicaption{中文表题}{English caption}`。如果需要在浮动体外写标题，可使用：

```tex
\smubicaptionof{figure}{中文图题}{English caption}
\smubicaptionof{table}{中文表题}{English caption}
```

算法环境建议继续使用普通 `\caption{...}`，不强制双语 caption。

### 横向页面

宽表格或横向图可放入 `smulandscape` 环境：

```tex
\begin{smulandscape}
  \begin{table}[p]
    \centering
    \smubicaption{中文表题}{English caption}
    ...
  \end{table}
\end{smulandscape}
```

横向页面会保留旋转后的页眉和页码。

### 无编号章节页眉

对致谢、附录、研究成果等 `\chapter*` 章节，先设置页眉文字：

```tex
\smusetfronthead{致谢}
\chapter*{致\quad 谢}
\addcontentsline{toc}{chapter}{致谢}
```

附录可写作：

```tex
\appendix
\smusetfronthead{附录}
\chapter*{附录}
\addcontentsline{toc}{chapter}{附录}
```

### 版权页

在论文最后调用：

```tex
\makecopyrightpage
```

该命令生成“南方医科大学学位论文原创性声明”和“学位论文版权使用授权书”。

## 附带的 Codex Skill

仓库附带 `smu-thesis-writing` Skill，供使用 Codex 编写或审核论文时选用。它不是 LaTeX 编译依赖，不使用 Codex 时可以忽略。该 Skill 主要用于：

- 统一中文论文中的术语、缩写、统计学用语和数学符号格式。
- 核对公式、算法、正文描述与实现代码是否对应。
- 在项目提供 `写作规范.md` 和 `术语表.md` 时，按其中的本地规则审核全文。
- 对照 Word/DOCX 模板检查字体、页边距、页眉页脚、横向页面、原创性声明和正文换行。
- 执行 `xelatex -> biber -> xelatex -> xelatex` 并检查最终日志。

安装到个人 Codex Skill 目录：

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R skills/smu-thesis-writing "${CODEX_HOME:-$HOME/.codex}/skills/"
```

安装后可以在 Codex 中直接调用：

```text
使用 $smu-thesis-writing 审核并规范这篇中文毕业论文。
```

其中的机械审查脚本也可以独立运行：

```bash
bash skills/smu-thesis-writing/scripts/audit-thesis.sh 毕业论文_smuthesis.tex
```

脚本输出的是待人工复核的候选项，并不表示每一处匹配都是错误。

## 字体说明

当前模板主要面向 macOS，默认中文字体为：

- 宋体：`STSong`
- 黑体：`Heiti SC Light`
- 楷体：`STKaiti`
- 仿宋：`STFangsong`
- 原创性声明页标题：等线粗体（`DengXian-Bold`）

Windows 或 Linux 用户需要根据本机字体修改 `smuthesis.cls` 中的 `\setCJKmainfont`、`\setCJKsansfont`、`\setCJKmonofont` 和相关字体族配置。

在 macOS 上，模板会优先读取 Microsoft Word 自带的 `Deng.ttf` 和 `Dengb.ttf`；在 Windows 上则使用系统安装的 `DengXian`。未找到等线字体时会回退到 `Heiti SC Light` 并给出编译警告。
