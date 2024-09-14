
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
- [Graphviz](https://graphviz.org/download/) (`dot` command)
- [GNU Make](https://www.gnu.org/software/make/)

### Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/Artumi-Systems-Ltd/makefile-docs-builder.git
   cd makefile-docs-builder
   ```

2. Place your `.md` and `.dot` files in the project directory.

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

### Customization

You can modify the Makefile to suit your project’s needs. For example, you can change the markers or add new rules for different document formats.

## License

This project is licensed under the MIT License.

