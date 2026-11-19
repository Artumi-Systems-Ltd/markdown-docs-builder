---
title: ""
author: ""
date: ""
# Number every heading (1, 1.1, 1.2 ...) so sections can be referred to on the phone.
# Cross-reference a heading with: see Heading Name (section \ref{heading-name})
numbersections: true
linkcolor: black
urlcolor: blue
citecolor: black
colorlinks: true
header-includes:
  - \usepackage[a4paper,margin=2cm]{geometry}  # Set margins to 2cm
  - \usepackage{fancyhdr}
  - \usepackage{lastpage}
  - \usepackage{xcolor}
  - \usepackage{hyperref}
  - \pagestyle{fancy}
  - \fancyhf{}
  - \rfoot{Artumi Systems Ltd — Confidential}
  - \lfoot{Document Name Here}
  - \cfoot{Page \thepage\ of \pageref{LastPage}}
  - \renewcommand{\headrulewidth}{0pt}
  - \renewcommand{\footrulewidth}{0.4pt}
  # Tables: thin light rule between rows (inserted by tables.lua) and a little extra row height.
  - \usepackage{colortbl}
  - \newcommand{\rowsep}{\arrayrulecolor{black!25}\midrule\arrayrulecolor{black}}
  - \renewcommand{\arraystretch}{1.15}

  # The Table of Contents is added by the Makefile "--toc" bit

# Optional: a boxed notice on its own page after the title, before the contents.
# Uncomment and edit for estimates, discussion papers etc.
# include-before:
# - |
#   ```{=latex}
#   \vspace*{1em}
#   \begin{center}
#   \fbox{\begin{minipage}{0.92\textwidth}
#   \vspace{0.6em}
#   \begin{center}{\Large\bfseries THIS IS AN ESTIMATE, NOT A QUOTATION}\end{center}
#   \vspace{0.3em}
#   \large
#   Explain what the reader should and should not rely on here.
#   \vspace{0.6em}
#   \end{minipage}}
#   \end{center}
#   \newpage
#   ```
---

\pagebreak
