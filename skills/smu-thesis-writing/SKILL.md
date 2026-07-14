---
name: smu-thesis-writing
description: Audit, revise, and standardize a Chinese graduate thesis, especially an SMU LaTeX thesis about Mendelian randomization, FGWAS, or statistical genetics. Use when Codex edits or reviews thesis prose, terminology, abbreviations, mathematical notation, formulas, algorithms, captions, tables, citations, or LaTeX formatting; matches LaTeX to a Word/DOCX thesis template including originality declarations, headers, footers, margins, portrait or landscape pages, fonts, spacing, and line breaks; checks a .tex thesis against 写作规范.md or 术语表.md; or performs a final consistency and compilation review.
---

# SMU Thesis Writing

Apply the thesis's local rules before general academic-writing preferences. Preserve technical meaning while making Chinese prose concise, formal, and consistent.

## Workflow

1. Locate the main `.tex` file and read `AGENTS.md`, `写作规范.md`, and `术语表.md` when present. If format matching is requested, also locate the exact source `.docx`. Treat the most specific current repository rule and the user's latest explicit preference as authoritative, including intentional departures from the Word source.
2. Establish the requested scope. Do not change acknowledgements unless the user explicitly authorizes it. Do not alter citation keys, bibliography data, figure paths, labels, or numerical results without a task-specific reason.
3. Audit terminology, abbreviation domains, statistics language, mathematical typography, formula definitions, captions, tables, and algorithms.
4. Explain any mathematical correction before or alongside editing when the choice is not mechanical. Check formulas against implementation code when code is supplied.
5. Make narrowly scoped edits. For exact Word/DOCX format matching, read [references/word-template-matching.md](references/word-template-matching.md) completely and follow its native-render, coordinate, and visual validation workflow.
6. Re-run the audit script and inspect each hit; the script reports candidates, not automatic errors.
7. Compile with `xelatex -> biber -> xelatex -> xelatex`. Check the final log for errors, undefined references or citations, missing glyphs, overfull boxes, underfull boxes, oversized floats, and material font substitutions.
8. Report changed categories, verification results, and any remaining decisions. Never claim that language, formulas, or Word-template fidelity are correct solely because LaTeX compiles.

## Language And Terms

- Write primarily in Chinese. Prefer direct academic prose; remove repetition, broken sentence connections, unnecessary spaces, and literal English syntax.
- Use `子代`, not `后代`; `方差-协方差矩阵`, not `变异-协方差矩阵`; `基因型插补`, not `基因型填充`.
- Use `讨厌参数` for nuisance parameter. Do not replace it with `滋扰参数` or `非目标参数` unless the user changes this preference.
- Use `P值`, `第一类错误率`, `检验效能`, `置信区间`, `效应估计值`, `因果效应`, `混杂偏倚`, `反向因果偏倚`, `线性回归模型`, `logistic回归模型`, and `覆盖率`.
- Distinguish a confounder (`混杂因素`) from the resulting bias (`混杂偏倚`).
- Write only Chinese for low-frequency or explicitly unretained terms, including 水平多效性、群体分层、遗传养育效应、遗传变异、等位基因、基因芯片、基因型插补、遗传度、多基因风险评分、选型婚配、王朝效应、核心家系、同胞对、父源、母源、家系均值、同胞差分 and 汇总统计量.

## Paragraph Structure

- Divide paragraphs by semantic center, not by connective words. Keep background, explanation, contrast, consequence, qualification, and summary in the same paragraph when they discuss the same object or claim.
- Do not start a new paragraph solely because a sentence begins with `然而`, `因此`, `此外`, `相比之下`, `与此同时`, `进一步`, `综上`, `随后`, `直到`, `后来`, or an English equivalent.
- Start a new paragraph when the research object, central claim, method category, trait pair or analysis direction, numbered algorithm step, theorem or proof stage, numbered case, or numbered limitation changes.
- Keep an introducing clause, its displayed formula, and the following symbol explanation in one paragraph when they form one argument. A display environment does not itself require a paragraph break.
- In structured abstracts, normally keep each labeled field such as background, objective, methods, results, or conclusion as one paragraph.
- Do not merge mechanically. After revising, scan paragraph starts and confirm that each remaining break marks a genuine semantic change rather than a transition phrase.

## Abbreviations

- Retain an English abbreviation only when the term occurs at least three times or is explicitly retained by the thesis rules.
- Treat the Chinese abstract and Chinese main text as independent abbreviation domains.
- At first occurrence in each domain, write `中文名称（English full name，ABBR）`. Afterwards use the abbreviation directly. Do not repeat the English definition or revert to the full Chinese name in ordinary prose.
- Allow full Chinese names in chapter or section titles, keywords, and fixed Chinese compound terms when needed for readability.
- Keep `SNP` and `IV` unchanged in Chinese prose regardless of number. Never write `SNPs` or `IVs` except inside immutable filenames, citation metadata, or English text.
- Retained abbreviations include MR, GWAS, SNP, FGWAS, FGWAS-MR, MRcML, MR-Lasso, MR-Egger, BMI, DNA, DGE, IGE, IV, IVW, WGS, WES, UKB, LD, SE, InSIDE, MA, DP, GoF, BIC', NTC, and MRMix.
- Define SE as `标准误（standard error，SE）` at first occurrence in each Chinese domain; use `SE` afterwards in prose, formulas, tables, and symbol lists.
- Keep parallel statistical expressions at the same naming level. After SE is defined, compare `经验 SE` with `理论 SE`; write `自助抽样得到的经验 SE` when the estimation source must be explicit, and avoid mixing `自助抽样标准差` with `理论 SE` in the same sentence.

## Mathematical Notation

- Typeset matrices in bold upright with `\mathbf{}`: `\mathbf{\Sigma}`, `\mathbf{\Omega}`, `\mathbf{A}`, `\mathbf{K}`, `\mathbf{C}`, `\mathbf{V}`, `\mathbf{0}`, and `\mathbf{I}`.
- Typeset vectors in bold italic with `\bm{}`: `\bm{\beta}`, `\bm{\gamma}`, `\bm{\eta}`, `\bm{\delta}`, `\bm{e}`, `\bm{r}`, `\bm{s}`, `\bm{l}`, `\bm{\phi}`, `\bm{\pi}`, `\bm{\theta}`, and `\bm{b}`.
- Do not bold subscripts, superscripts, or transpose symbols. Use braces consistently, such as `\mathbf{A}` and `\bm{\gamma}` rather than unbraced forms.
- Use `\mathbf{0}_{3\times 3}` for a zero matrix and `\bm{0}` for a zero vector.
- Keep symbol roles stable. In this thesis, use
  - `\mathbf{A}_j(\alpha)=\mathbf{\Sigma}_{\beta_j}+\alpha^2\mathbf{\Sigma}_{\gamma_j}` for the combined covariance matrix;
  - `\mathbf{K}_j=\mathbf{A}_j^{-1}\mathbf{\Sigma}_{\gamma_j}\mathbf{A}_j^{-1}` for the information-related matrix;
  - a distinct symbol such as `\mathbf{V}(\alpha)` for a joint covariance matrix rather than reusing the precision symbol `\mathbf{\Omega}`.
- Check dimensions, transposes, signs, definitions, and the correspondence between prose, algorithms, formulas, and code. Compilation does not validate mathematics.

## Formula Presentation

- Put simple values and short assignments inline.
- Use `align` for related or multiline formulas; do not scatter related expressions across repeated `\[...\]` blocks.
- Put `\begin{align}`, `\begin{equation}`, `\begin{algorithm}`, and similar environments on their own source lines.
- Break long formulas at meaningful operators and use `\notag` on continuation lines when only one equation number is intended.
- Preserve an expanded formula when later proofs need its leading term and stochastic remainders separately. A compact Schur-complement form may be equivalent but less useful for proving SE consistency.
- For MR-Family, keep the code-aligned expanded profile-curvature formula when the subsequent proof establishes SE consistency. For MRcML-Family, a Schur-complement expression is acceptable for conditional within-submodel SE unless an analogous consistency proof is added.

## Citations And Protected Content

- Do not add `\cite{}` or `\autocite{}` merely because a statement could use a citation. The user controls citation insertion unless they explicitly request literature recommendations or citation edits.
- When reviewing literature coverage, identify the claim and suggested source separately; verify title, authors, year, journal, and DOI before proposing a BibTeX entry.
- Preserve acknowledgements exactly unless explicitly asked to edit them. For broad mechanical rewrites, compare the acknowledgement section before and after.
- Treat declaration and authorization text as controlled template content. Copy it from the designated Word source rather than paraphrasing. For the current SMU template, distinguish `保密/不保密` from the incorrect `暂不公开/立即公开` variant.

## Page Layout

- Preserve page parity rules. In the current thesis, an odd originality-declaration page may show `硕士学位论文`; do not force `原创性声明` into both odd and even headers.
- Use 楷体 for headers, 仿宋 GB2312 for the originality-declaration body, and the source template's title font. Verify the embedded PDF font instead of trusting the LaTeX family command name.
- Validate portrait and landscape pages independently. Check header rule thickness, header/table-header start positions, margins, page numbers, and restored geometry after each landscape environment.
- For claims of exact Word matching, compare extracted text, PDF bounding boxes, and rendered page images. State any intentional mismatch, such as replacing the Word template's degree type with the user's actual degree type.

## Automated Audit

Run:

```bash
bash ~/.codex/skills/smu-thesis-writing/scripts/audit-thesis.sh path/to/main.tex
```

Review every reported line in context. Ignore legitimate matches in English abstracts, immutable image filenames, labels, citation keys, and bibliography metadata.
