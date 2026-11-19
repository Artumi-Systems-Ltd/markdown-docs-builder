
# Makefile-Docs-Builder

This repository automates the process of converting Markdown (`.md`) files into multiple document formats such as PDF and ODT, while also handling the conversion of `.dot` files (Graphviz) into PNG images. It also supports preprocessing of Markdown files to strip out specific sections between custom markers before conversion.

Really, the only moving part is the Makefile, and the listed pre-requisites. This isn't so much a software project as just a marshalling of other tools built
with the purpose of making the production of documents (quotes) more efficient.

## Features

- Convert `.md` files to `.pdf` and `.odt` using Pandoc.
- Convert `.dot` files to `.png` using Graphviz.
- Preprocess `.md` files to remove text between custom markers (`<!-- START -->` and `<!-- END -->`).
- Automatic detection of changes in `.dot` files, triggering reprocessing of all Markdown files.
- Simple cleanup of generated files.

## Usage

### Prerequisites

Ensure you have the following tools installed:

- [Pandoc](https://pandoc.org/installing.html)
- Latex - for pandoc
- [Graphviz](https://graphviz.org/download/) (`dot` command)
- [GNU Make](https://www.gnu.org/software/make/)

Ubuntu:

```
apt install pandoc texlive-latex-base texlive-latex-extra texlive-luatex graphviz
```

### Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/Artumi-Systems-Ltd/makefile-docs-builder.git
   cd makefile-docs-builder
   ```

2. Place your `.md` and `.dot` files in the project directory.

3. Run `make` in the directory. The `Makefile` contains the rules that will then convert the .md and .dot files to make complete documents.

### Markers for Stripping Text

In your Markdown files, use the following markers to define sections that should be stripped out before conversion:

```markdown
<!-- START -->
This text will be removed during preprocessing.
<!-- END -->
```

### Running the Makefile

1. **Convert `.md` to `.odt` and `.pdf`** and `.dot` to `.png`:

   ```bash
   make
   ```

   This will:
   - Convert all `.dot` files to `.png`.
   - Preprocess all `.md` files to strip text between the `<!-- START -->` and `<!-- END -->` markers.
   - Convert the preprocessed `.md` files to both `.odt` and `.pdf` formats.

2. **Clean generated files**:

   ```bash
   make clean
   ```

   This will remove all `.png`, `.odt`, `.pdf`, and temporary files.

### Example Structure

```
makefile-docs-builder/
├── file1.md
├── file2.md
├── diagram.dot
├── Makefile
├── tables.lua
└── README.md
```

After running `make`, you will get:

```
makefile-docs-builder/
├── file1.md
├── file1.odt
├── file1.pdf
├── file2.md
├── file2.odt
├── file2.pdf
├── diagram.dot
├── diagram.png
├── Makefile
└── README.md
```

### Document defaults

New documents made with `new-doc.sh` start from `template.md` and get these defaults:

- **Numbered headings** (`numbersections: true`), so sections can be referred to on the phone. To cross-reference
  a heading, write `see Heading Name (section \ref{heading-name})` — the label is the heading in lower case with
  spaces as hyphens, and the number updates itself if sections move.
- **Ruled tables.** `tables.lua` adds a thin light-grey rule between table rows in the PDF, so it is clear where one
  row ends when cells wrap onto several lines. The rule is defined as `\rowsep` in the template header, and the row
  height by `\arraystretch`. (Alternating row shading was tried and looked worse: it overhangs the table edges and
  leaves gaps at the header rule.)
- **LuaLaTeX** as the PDF engine, so `—`, `£` and `™` work without extra setup.
- An optional **boxed notice page** (e.g. "This is an estimate, not a quotation"), commented out in the template
  header — uncomment `include-before` to use it.

Tips:

- **Diagrams:** use `rankdir=TB` (top to bottom) and font sizes of about 13–15 in `.dot` files. Wide left-to-right
  diagrams get shrunk to page width and the text becomes unreadable. Avoid `rank=same` across clusters — it drags
  nodes out of their boxes and widens the diagram.
- Text between `<!-- START -->` and `<!-- END -->` is for draft notes; it never reaches the PDF.

### Customization

You can modify the Makefile to suit your project’s needs. For example, you can change the markers or add new rules for different document formats.

## License

This project is licensed under the MIT License.

