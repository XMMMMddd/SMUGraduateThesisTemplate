# 南方医科大学研究生毕业论文 LaTeX 模板

本项目用于编写南方医科大学研究生毕业论文，提供一套基于 LaTeX 的论文模板文件，适用于硕士、博士学位论文的排版与编译。

## 项目内容

- `毕业论文_smuthesis.tex`：论文主文件，用于填写论文题目、作者、导师、摘要、正文、参考文献、致谢等内容。
- `smuthesis.cls`：南方医科大学研究生毕业论文文档类文件，定义封面、章节、字体、页眉页脚、图表标题等排版格式。
- `图片/image.png`：封面页使用的“南方医科大学”校名字图。
- 编译后会生成 `毕业论文_smuthesis.pdf` 示例 PDF。

## 使用方式

1. 修改 `毕业论文_smuthesis.tex` 中的论文基本信息：

   ```tex
   \title{论文标题}
   \englishtitle{English Thesis Title}
   \coverctitle{中文题名第一行}{中文题名第二行}
   \coveretitle{English title line one}{English title line two}{English title line three}
   \schoolnameimage{图片/image.png}
   \author{作者姓名}
   \supervisor{导师姓名\quad 教授}
   \institute{学院名称}
   \grade{2026级}
   \major{专业名称}
   \trainingtype{学术型}
   \degreelevel{硕士}
   \funding{课题来源}
   \submitdate{2026年6月}
   \titlepagedate{2026年6月}
   \location{广州}
   \date{2026年6月}
   ```

   `\coverctitle` 和 `\coveretitle` 用于控制封面页题名的手动分行。封面模板按学校 Word 模板样式固定为 2 行中文题名和 3 行英文题名，每一行下方都有横线。

2. 根据需要选择学位类型：

   ```tex
   \documentclass[master]{smuthesis}
   ```

   其中 `master` 表示硕士论文；不加该选项时默认为博士论文。

3. 在主文件中填写中文摘要、英文摘要、正文各章节、参考文献、致谢和研究成果等内容。

4. 使用 XeLaTeX + Biber 编译：

   ```bash
   xelatex 毕业论文_smuthesis.tex
   biber 毕业论文_smuthesis
   xelatex 毕业论文_smuthesis.tex
   xelatex 毕业论文_smuthesis.tex
   ```

## 参考文献

模板主文件默认使用 `biblatex`、`biber` 和国标数字顺序制样式 `gb7714-2015`：

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

推荐在 Zotero 中使用 Better BibTeX 插件，将文献库或分组用 `Better BibLaTeX` 格式自动导出为项目根目录下的 `mybib.bib`。正文中使用 `\cite{文献key}` 引用，参考文献位置使用：

```tex
\printbibliography[heading=smubibliography,title={参考文献}]
```

## 字体说明

当前模板主要面向 macOS 环境，`smuthesis.cls` 中默认配置了以下中文字体：

- 宋体：`STSong`
- 黑体：`Heiti SC Light`
- 楷体：`STKaiti`
- 仿宋：`STFangsong`

如需在 Windows 或 Linux 环境中使用，请根据本机已安装字体修改 `smuthesis.cls` 中的 `\setCJKmainfont`、`\setCJKsansfont`、`\setCJKmonofont` 等配置。

## 注意事项

- 建议使用 TeX Live 或 MacTeX，并通过 XeLaTeX 编译。
- 编译产生的 `.aux`、`.log`、`.toc`、`.out`、`.synctex.gz` 等辅助文件已通过 `.gitignore` 忽略。
- 本模板用于论文写作和排版参考，最终格式要求请以南方医科大学研究生院或所在学院发布的最新论文规范为准。
