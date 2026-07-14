# Word Template Matching

Use this workflow when a LaTeX page must reproduce a designated Word/DOCX thesis template. The Word file is the content and layout authority unless the user explicitly overrides one of its choices.

## Establish The Reference

1. Identify the exact `.docx`, target section, and corresponding LaTeX page.
2. Read `word/document.xml`, `word/styles.xml`, the relevant header/footer XML, and section properties from the DOCX archive. Resolve inherited paragraph and run properties; a missing property does not mean a default of zero.
3. Record the exact text before changing layout. Do not reconstruct declarations from memory or a different template version.
4. Export the DOCX to PDF with Microsoft Word when available. On macOS, Word's AppleScript `save as ... file format format PDF` provides a native reference without UI automation.
5. Do not use a LibreOffice render as the final metric reference when fonts are substituted, glyphs appear as boxes, or page count differs. It remains useful for structural inspection only.

## Convert Word Measurements Correctly

- Word XML uses twentieths of a point for most paragraph measurements: divide twips by 20.
- `w:sz` and `w:szCs` use half-points: divide by 2.
- Read `w:pgMar`, `w:spacing`, `w:ind`, tabs, alignment, header distance, footer distance, and section page size together.
- Word/PDF points are PostScript points. For exact LaTeX matching, use `bp`, not TeX `pt`: `1bp=1/72in`, while `1pt=1/72.27in`.
- The `pt`/`bp` difference is small per character but accumulates across a Chinese line and can change wrapping by one character. A Word 11-point font, 23-point fixed line spacing, and 24-point indent should normally begin as `11bp`, `23bp`, and `24bp` in LaTeX, then be checked against the native PDF.

## Match Text Flow

1. Use the exact installed font. Confirm it with `fc-match`, and confirm the embedded result with `pdffonts`.
2. Distinguish `FangSong_GB2312` from system `STFangsong` or another 仿宋. They have different metrics.
3. Match paragraph alignment. If Word is left-aligned, use a local `\raggedright`; global XeTeX CJK glue can otherwise stretch lines to the right edge.
4. Avoid forced `\\` breaks until font, width, indent, units, and alignment are correct. Let the paragraph wrap naturally, then compare every line ending.
5. Keep Chinese punctuation literal and full-width, including `“”` and `（ ）`. Verify extracted PDF text so visually similar half-width punctuation is not missed.
6. For symbols such as `□`, select a font containing the actual glyph. A font switch can introduce `\CJKecglue`; a zero-width kern before the switch can suppress unwanted inter-font spacing. Compare the symbol and following field coordinates after compilation.

## Match The Current SMU Declaration Page

- Use the Word source's exact originality declaration and copyright authorization text.
- Use `1、保密□，在___年解密后适用本授权书。` and `2、不保密□。` when that wording appears in the designated template; do not substitute `暂不公开/立即公开`.
- Use 仿宋 GB2312 for body text, 11 Word points, fixed 23-point line spacing, and a 24-point first-line indent when confirmed by the source XML.
- Use 宋体 bold 18 Word points for the two titles when confirmed by the source XML.
- Keep the user's degree type in the odd header. In this thesis, odd pages may show `硕士学位论文`; the even header may show `南方医科大学学位论文原创性声明`.
- Render literal Chinese quotation marks around `√` and inspect the checkbox and underline visually.

## Validate The Result

1. Run the full compile sequence: `xelatex -> biber -> xelatex -> xelatex`.
2. Extract the reference and candidate pages with `pdftotext -layout` and compare paragraph text and line endings.
3. Extract geometry with `pdftotext -bbox-layout`. Compare title, body, signature fields, checkbox lines, headers, and page numbers. For a strict match, target sub-point agreement and investigate errors above 0.1 bp instead of compensating blindly.
4. Render both pages at the same resolution with `pdftoppm` and inspect them side by side. Bounding-box agreement does not catch font appearance, rule thickness, missing glyphs, or overlapping punctuation.
5. Check `pdfinfo` page count and size, `pdffonts` embedded fonts, and the final LaTeX/Biber logs.
6. Preserve intentional differences and report them explicitly. Do not claim the pages are identical if degree text, page number, header position, or another user-selected field intentionally differs.
