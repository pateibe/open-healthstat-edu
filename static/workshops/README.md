# Applied statistics for health professionals

This directory contains the source for the [workshop website](https://bern-movement-lab.github.io/open-healthstat-edu/workshops/_site/index.html) used in teaching applied statistics for health professionals at the School of Health Professions of the Bern University of Applied Sciences.

## Info for contributors and maintainers

### Local requirements

You need an installation of [R](https://www.r-project.org/) with the following R packages to conduct the computations for creating figures, example output, etc. in the book:

- `tidyverse`
- `rmarkdown`
- `readxl` # to read data from Excel spreadsheets
- `readr` # provides read_csv() (slow with large files!)
- `data.table` # provides fread()
- `gridExtra`# for making subplots
- `ggpubr`# subplots with common legend (ggarrange())
- `tictoc`# to measure execution time
- `gghighlight`# to easily highlight graphs and graph elements with ggplot
- `plotly`# making ggplots interactive
- `openxlsx`# to write data frames to Excel files
- `magick`# integrate images with ggplot: image_ggplot(image_read(imgpath))
- `cowplot`# integrate images with ggplot: ggdraw() + draw_image(`doggy.jpeg`)
- `qqplotr`# for nice QQ-plots
- `mosaic`# favstats for descriptive statistics
- `broom`# Statistische Analyseobjekte in Tidy Tibbles konvertieren
- `ez`# repeated-measures ANOVA
- `pastecs`# nice summary statistics of data frame
- `multcomp`# post-hoc tests
- `lme4`# multi-level modelling (e.g. mixed-effect in repeated-measures designs)
- `HLMdiag`# diagnostics of multi-level models
- `WRS2`# collection of robust statistical methods
- `car`# Levene Test
- `DT`# to show data tables interactively (not for PDF output!)
- `kableExtra`# table formatting
- `blandr`# Bland-Altman
- `hrbrthemes`# nicer ggplots
- `latex2exp`# Render LaTeX math
- `afex`# to run ANOVA by ggstatsplot functions
- `ggstatsplot`# for statistical analysis and plotting in one step
- `jmv`# jamovi library
- `gtools`# format p-values with stars
- `rstatix`# for easy statistical tests and formatting of results
- `htmltools`# for HTML output (e.g. in RMarkdown)
- `emmeans`# for estimated marginal means (EMMs) and contrasts
- `languageserver`# for R language server (e.g. for code completion in VSCode)
- `exams` # for creating exams in R (e.g. for Moodle)
- `rio`# for importing and exporting data in various formats (e.g. SPSS, Stata, Excel, CSV, etc.)
- `jtools` # for plotting regression results (e.g. interact_plot())
- `irr` # reliabilty coefficients
- `BlandAltmanLeh` # Bland Altman diagrams
- `table1` # create table 1 in manuscripts
- `flextable` # easily crate tables for reporting and publications
- `viridis` # colors compatible for color-blindness
- `openintro` # Datasets and Supplemental Functions from 'OpenIntro' Textbooks and Labs
- `ggpmisc` # Miscellaneous Extensions to 'ggplot2'
- `ISwR` # Datasets and scripts from book Introductory Statistics with R
- `plot3D` # Plotting Multi-Dimensional Data
- `DescTools` # Tools for descriptive statistics
- `epitools` # Epidemiology Tools
- `mlbench` # Machine Learning Benchmark Problems
- `plotrix` # Various Plotting Functions
- `AER` # Applied Econometrics with R
- `survminer` # Drawing Survival Curves using 'ggplot2'
- `arsenal` # An Arsenal of 'R' Functions for Large-Scale Statistical Summaries

Since the book is written in Quarto Markdown, an installation of [Quarto](https://quarto.org/) is necessary for rendering.

### How to contribute

Clone a local copy of the repository:

``` shell
git clone git@github.com:bern-movement-lab/open-healthstat-edu.git
```

Make changes to the book in the subdirectory `~/static/workshops` as desired and render the book locally:

``` shell
quarto render
```

The workshop website will be rendered and the results from computations are stored in the `_freeze` directory, which must be committed to the repository. This project uses a GitHub Action to automatically render the files and publish the resulting content whenever changes in the source code are pushed to the repository. However, local rendering as previously described is necessary for the executable code in the Quarto documents, since this is not implemented to be overtaken as part of the GitHub Action.
