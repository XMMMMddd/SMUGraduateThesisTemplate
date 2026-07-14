#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 path/to/main.tex" >&2
  exit 2
fi

file=$1
if [[ ! -f "$file" ]]; then
  echo "File not found: $file" >&2
  exit 2
fi

if ! command -v rg >/dev/null 2>&1; then
  echo "This audit requires rg (ripgrep)." >&2
  exit 2
fi

scan() {
  local title=$1
  local pattern=$2
  echo
  echo "[$title]"
  rg -n --pcre2 "$pattern" "$file" || true
}

echo "Auditing: $file"
echo "Matches are review candidates; inspect English text, paths, labels, and citation keys before editing."

scan "Statistical terminology" 'p值|统计功效|统计效能|α错误|覆盖水平|效应大小|因果影响|逻辑回归|逻辑斯谛回归'
scan "Genetics and family terminology" '后代|变异-协方差|遗传率|基因型填充|SNP芯片|复杂特征|基因变异|对偶基因|遗传型|表现型|遗传培育效应'
scan "Nuisance parameter preference" '滋扰参数|非目标参数'
echo
echo "[Plural abbreviations in Chinese context]"
perl -CS -pe 's{图片/[^{}]*}{}g; s/^%%.*$//' "$file" \
  | rg -n --pcre2 '个\s*(?:SNPs|IVs)|(?:SNPs|IVs)\s*(?:的|为|作为|均|中|数量|集合|效应|筛选|存在|无效|有效|之间)' \
  || true
scan "Unbraced bold commands" '\\(?:mathbf|bm)(?!\{)\s*(?:\\[A-Za-z]+|[A-Za-z])'
scan "Matrix or vector font mismatch" '\\bm\{(?:\\Sigma|\\Omega|A|K|C|V|I)\}|\\mathbf\{(?:\\beta|\\gamma|\\eta|\\delta|e|r|s|l|phi|pi|theta|b)\}'
scan "Suspicious zero type" '\\Cov\([^\n]+\)=\\bm\{0\}|\\Var\([^\n]+\)=\\mathbf\{0\}(?!_)'
scan "Inline environment starts" '.+\\begin\{(?:align\*?|equation\*?|algorithm|enumerate)\}'
scan "Repeated or broken punctuation" '的的|了了|并且并|以及以及|因此因此|从而从而|，。|。。|，，|；。|：。|\s+[，。；：、]'
scan "Known symbol collision" '\\mathbf\{\\Omega\}\(\\alpha\)'

echo
echo "Audit complete. Also verify first definitions in the Chinese abstract and main text manually."
