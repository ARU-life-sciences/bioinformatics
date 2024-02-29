# Variables in R

Variables are the building blocks of code. They are a very simple statement of
assignment. They are really for setting apart a block of memory in your computer
so you can access the variable later. Use the `<-` to assign a value to a variable.

```{r}
# assigning a value 1 to x
x <- 1
# returning x
x
```

We can assign as much as we like.

```{r}
# x is 1 and y is 2
x <- 1
y <- 2

# over write x to 5
x <- 5

# return x
x
```

Now we can start building a simple program.

```{r}
# assign x to 1 and y to 5
x <- 1
y <- 5

# multiply x and y together
# referencing the variables we just created
z <- x * y

# return z
# the cat function prints text to the terminal
# functions are called with the function name
# followed by parentheses with optional arguments inside
cat("The value of z is:", z)
```

## Over to you

1. Create a variable called `first` and assign it a numerical value
2. Create a second variable called `second` and assign it another numerical value
3. Multiply your two variables together
4. Are there other ways to assign to variables in R? For help type `` ?`<-` ``
in the console.



