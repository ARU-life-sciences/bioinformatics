# General programming in R

Welcome to the general introduction to programming in R. This is quite an opinionated introduction, and mainly focuses on base R - that is, R without any additional packages installed.

If this is your first time here, please scroll past the contents and go to the `Prerequisites` and then the `Installation` sections.

## Contents

1. Basic introduction
  Here we will look at how to create variables, the different data types in R, and what classes are. Variables and assignment are the building blocks of all code, along with functions. A good understanding of R will require you to understand all the basic data types - things like numbers and strings. Classes are a special type of more complex data type. The classes are a bit more advanced and may want to be revisited later on after you have a more in depth understanding of the language, especially functions.
2. Working with data frames
  Data frames are probably _the_ central complex data type in R. They are incredibly useful ways to interact with tabular data. We first read in data into R data frame objects. We then take a dive into how we can select and filter the data. Lastly we look at how to write data back to tabular files.
3. Functional programming
  Functions are ubiquitous in R. Functions build useful and reusable code, help us to automate tasks and make fewer mistakes. They can also perform complex tasks which would be tedious to continually write out. We will look at the syntax to make functions, and how to apply them on data frames.
4. TODO...

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
