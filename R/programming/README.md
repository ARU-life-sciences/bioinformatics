# General Programming in R

Welcome to the general introduction to programming in R. This is an opinionated
introduction that focuses on base R — R without any additional packages — before
branching out into ggplot2 for plotting.

All tutorials are **interactive** and run directly in your browser using the
`learnr` package. You can run code, check your answers, and get hints without
leaving the page.

---

## Contents

### 0. Introduction ← **Start here**
`0_introduction/`

- **introduction.R** — A plain R script. Open it in RStudio and run it line
  by line. Covers: what R is, the RStudio panes, your first R code, what `.Rmd`
  files are, and how to launch the learnr tutorials.

### 1. Basic introduction — Variables, Data Types & Classes
`1_variables_datatypes_classes/`

- **variables.Rmd** — Variable assignment and operators
- **data_types.Rmd** — Primitive types (numbers, booleans, strings) and compound
  types (vectors, lists, factors, matrices, data frames)
- **classes.Rmd** — S3 classes and methods; building custom classes *(advanced — revisit later)*

### 2. Working with Data Frames
`2_working_with_dataframes/`

- **reading_and_viewing.Rmd** — Reading CSV files; exploring data structure
- **indexing.Rmd** — Subsetting, filtering, and sorting data
- **writing.Rmd** — Writing data back to CSV and TSV files

### 3. Functional Programming
`3_functional_programming/`

- **functions.Rmd** — Calling functions; parameters; composing functions
- **writing_functions.Rmd** — Writing your own functions; default arguments; if/else; ifelse()
- **functions_on_data.Rmd** — lapply, sapply, apply, tapply

### 4. Plotting
`4_plotting/`

- **basic_plots.Rmd** — Base R: histograms, scatter plots, bar plots, box plots
- **more_advanced_plots.Rmd** — ggplot2: grammar of graphics, geoms, faceting, themes

### 5. Reading Error Messages *(new)*
`5_reading_errors/`

- **reading_errors.Rmd** — The 5 most common errors; warnings vs messages; how to get help

### 6. Capstone Project *(new)*
`6_capstone/`

- **capstone.Rmd** — End-to-end analysis of the Palmer Penguins dataset:
  import → clean → summarise → filter → function → plot → export

---

## Prerequisites

You will need:

- **R** and **RStudio** installed
- The **learnr** package: `install.packages("learnr")`
- The **ggplot2** package (for module 4+): `install.packages("ggplot2")`

---

## Running the interactive tutorials

Each `.Rmd` file in this course is a **learnr tutorial**. Open the `.Rmd` file
in RStudio and click the **"Run Document"** button at the top of the editor.
The tutorial will open in a browser tab (or the RStudio Viewer pane).

Alternatively, run from the R console:

```r
learnr::run_tutorial("1_variables_datatypes_classes/variables.Rmd")
```

Or use the **Tutorial** pane in RStudio (top-right panel → Tutorial tab) if
the tutorials are installed as a package.

> **Note:** If you are viewing a compiled HTML file (`htmls/` subdirectory),
> the code will not be interactive. Run the `.Rmd` file directly for the full
> learnr experience.

---

## Suggested order

Work through the modules in numbered order. Each module builds on the previous.
The capstone is designed to be attempted after completing all other modules.

| Module | Format | Estimated time |
|--------|--------|---------------|
| 0 — Introduction | Plain `.R` script | 15–20 min |
| 1 — Variables & Types | learnr tutorial | 45–60 min |
| 2 — Data Frames | learnr tutorial | 60–75 min |
| 3 — Functions | learnr tutorial | 60–75 min |
| 4 — Plotting | learnr tutorial | 60–75 min |
| 5 — Reading Errors | learnr tutorial | 20–30 min |
| 6 — Capstone | learnr tutorial | 60–90 min |

---

## Datasets used

| Dataset | Description | Source |
|---------|-------------|--------|
| `barley.csv` | Yield (bushels/acre) from Minnesota barley trials, 1931–32 | R `lattice` package |
| `cats.csv` | Body & heart weights of domestic cats (Fisher 1947) | R `MASS` package |
| Palmer Penguins | Morphological measurements of 344 penguins from 3 species | Horst et al. 2020 |

---

## R Markdown

R Markdown is a flavour of Markdown that allows you to embed R code in a wider
document. See `https://rmarkdown.rstudio.com/articles_intro.html` for more.
