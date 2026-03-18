# =============================================================================
#
#   Introduction to R
#   ARU Life Sciences — Bioinformatics
#
# =============================================================================
#
# Welcome! This is an R script — the most basic kind of R file.
#
# Everything on a line that starts with # is a COMMENT. R ignores it.
# Comments are for humans, not the computer. Use them generously.
#
# Everything else is CODE. R will execute it.
#
# HOW TO RUN THIS FILE
# --------------------
# You have a few options:
#
#   1. Run one line at a time:
#      Click on a line, then press Ctrl+Enter (Windows/Linux)
#                                or  Cmd+Enter  (Mac)
#      The result appears in the Console pane below.
#
#   2. Run the whole file at once:
#      Press Ctrl+Shift+Enter (Windows/Linux)
#      or   Cmd+Shift+Enter   (Mac)
#
# Try it now — place your cursor on the line below and press Ctrl+Enter:

1 + 1


# =============================================================================
# PART 1: What is R?
# =============================================================================
#
# R is a programming language designed for statistics and data analysis.
# It was created by statisticians, so it has excellent built-in support for
# things like computing means, fitting models, and drawing plots.
#
# R is free, open source, and has a huge ecosystem of packages that extend
# what it can do — including bioinformatics, genomics, ecology, and more.
#
# When you write R code in a script like this one, you are giving precise,
# reproducible instructions to your computer. Unlike clicking around in
# Excel, every step is recorded and can be re-run exactly.


# =============================================================================
# PART 2: What is RStudio?
# =============================================================================
#
# RStudio is the application you are most likely using to read this file.
# It is an IDE (Integrated Development Environment) — a friendly wrapper
# around R that makes it much easier to write, run, and organise your code.
#
# RStudio has four main panes:
#
#  +---------------------------+---------------------------+
#  |                           |                           |
#  |   SOURCE (top left)       |   ENVIRONMENT (top right) |
#  |                           |                           |
#  |   This is where you       |   Shows all variables     |
#  |   write and edit          |   you have created in     |
#  |   your scripts.           |   the current session.    |
#  |   <-- You are here.       |                           |
#  +---------------------------+---------------------------+
#  |                           |                           |
#  |   CONSOLE (bottom left)   |   FILES / PLOTS / HELP    |
#  |                           |   (bottom right)          |
#  |   Where R actually runs.  |                           |
#  |   Output and errors       |   Browse files, see       |
#  |   appear here.            |   plots, read help pages. |
#  |                           |                           |
#  +---------------------------+---------------------------+
#
# You can type R code directly into the Console and press Enter to run it.
# But scripts (like this file) are better — they save your work.


# =============================================================================
# PART 3: Your first R code
# =============================================================================

# R can do arithmetic. Run these lines one at a time.

10 + 3
10 - 3
10 * 3
10 / 3
10 ^ 2     # exponentiation (10 squared)
10 %% 3    # modulo — the remainder after division (10 divided by 3 leaves 1)


# ----------------------------------------------------------------------------
# Variables
# ----------------------------------------------------------------------------
#
# A variable stores a value so you can refer to it later.
# Use the <- operator to assign a value to a name.

species_count <- 42
species_count

body_mass_kg  <- 3.2
body_mass_kg

# You can use variables in expressions:
body_mass_g <- body_mass_kg * 1000
body_mass_g

# Variable names cannot start with a number or contain spaces.
# Convention in R is to use lowercase_with_underscores.

# After running the lines above, look at the ENVIRONMENT pane (top right).
# You should see species_count, body_mass_kg, and body_mass_g listed there.


# ----------------------------------------------------------------------------
# Printing output
# ----------------------------------------------------------------------------
#
# Just typing a variable name prints its value. But the cat() function
# lets you build more informative messages:

cat("There are", species_count, "species in this dataset.\n")
cat("Mean body mass:", body_mass_kg, "kg (", body_mass_g, "g)\n")

# The \n at the end means "newline" — it starts a new line in the output.


# ----------------------------------------------------------------------------
# Getting help
# ----------------------------------------------------------------------------
#
# To read the help page for any function, type ? followed by its name
# and run the line. The help page appears in the bottom-right pane.

?mean
?cat
?sqrt

# You can also search more broadly:
??histogram


# =============================================================================
# PART 4: What is an R Markdown (.Rmd) file?
# =============================================================================
#
# So far you have been working with a plain R SCRIPT (.R file).
# A script is just code — nothing else.
#
# An R MARKDOWN file (.Rmd) is different. It mixes:
#   - Normal text (explanations, headings, bullet points)
#   - R code blocks called "chunks"
#   - The output those chunks produce (numbers, plots, tables)
#
# When you "knit" an Rmd file, R runs all the code and weaves the results
# into a formatted document — HTML, PDF, or Word.
#
# Here is what a code chunk looks like inside an Rmd file:
#
#   ```{r}
#   mean(c(1, 2, 3, 4, 5))
#   ```
#
# The back-ticks and {r} tell R Markdown "run this as R code".
# Everything outside those fences is ordinary prose.
#
# Rmd files are great for writing reports, tutorials, and analyses where
# you want your explanation and your code to live side by side.
#
# You do NOT need to fully understand Rmd files before learning R.
# Think of it as a fancier way of presenting R code — the R itself
# is identical to what you write in a plain script like this one.


# =============================================================================
# PART 5: What are the learnr tutorials?
# =============================================================================
#
# The rest of this course uses a special kind of Rmd file called a
# LEARNR TUTORIAL. When you open one in RStudio and click "Run Document",
# it launches an interactive webpage where you can:
#
#   - Read explanations
#   - Run and edit code directly in your browser
#   - Answer quiz questions with instant feedback
#   - Get hints if you are stuck
#
# You do not need to understand how learnr works to use it.
# Just open the .Rmd file, click "Run Document", and follow the instructions.
#
# IMPORTANT: you must install two packages first (run these lines once):

# install.packages("learnr")   # <- remove the leading # and run this line
# install.packages("ggplot2")  # <- same here


# =============================================================================
# PART 6: What's next?
# =============================================================================
#
# The modules in this course are:
#
#   1. Variables, Data Types & Classes    — 1_variables_datatypes_classes/
#   2. Working with Data Frames           — 2_working_with_dataframes/
#   3. Functional Programming             — 3_functional_programming/
#   4. Plotting                           — 4_plotting/
#   5. Reading Error Messages             — 5_reading_errors/
#   6. Capstone Project                   — 6_capstone/
#
# Open the first module:
#   1_variables_datatypes_classes/variables.Rmd
#
# Click "Run Document" to launch it as an interactive tutorial.
#
# Good luck — and remember: errors are normal. Every programmer gets them.
# The skill is learning to read them calmly.

# =============================================================================
