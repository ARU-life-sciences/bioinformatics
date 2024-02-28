# General programming in R

Welcome to the general introduction to programming in R. This is quite an opinionated introduction, and mainly focuses on base R - that is, R without any additional packages installed.

## Prerequisites

You will need:

- RStudio + R installed
- R markdown installed and a basic knowledge of R markdown
  - install with `install.packages("rmarkdown")` on your console

## Installation
  
Please clone this repository. You can do this on the terminal:

```bash
git clone https://github.com/ARU-life-sciences/bioinformatics
cd bioinformatics/R/programming
```

Or through putting this inside your browser (Chrome/FireFox/Edge):

`https://github.com/ARU-life-sciences/bioinformatics/archive/refs/heads/main.zip`

And then unzipping this folder.

In R, you will need to change your working directory to be inside the folder you want to work in. For example, for the second tutorial `2_working_with_dataframes`, you will need to set the working directory to be this folder. Do this in R with `setwd()`.

```R
# change path/to/folder with the location of the directory on your machine
setwd("path/to/folder/")
```

## R markdown

R markdown is a flavour of markdown which allows you to embed R code snippets in the context of a wider document. It allows for both interactive and reproducible analyses.

Please see `https://rmarkdown.rstudio.com/articles_intro.html` for more information.
