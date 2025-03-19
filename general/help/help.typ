#import "../../typst/format.typ": conf, formatter, shell

#show: doc => conf(
  title: [Getting help],
  authors: (
    (
      name: "Max Carter-Brown",
      affiliation: "Anglia Ruskin University, Wellcome Sanger Institute",
      email: "max.carter-brown@aru.ac.uk",
    ),
  ),
  doc,
)

#show: doc => formatter(doc)

= Introduction

== Why get help?

All base commands which you call on the command line in your terminal will have
in-built help. Getting help, or looking at the manual pages (the man pages) is a
really important part of developing your skills. There are multiple situations
in which you might want to get help:

- You don't know what the command does.
- To get more information about the command, and potentially examples.
- To look up syntax and how the command is called.
- To look up the flags (e.g. `-e` - a dash followed by a character), options (e.g. `-e <value>` where `<value>` is
  a user input like a number, or a file path), or positional arguments.

== A generalised tool

Before we look at a specific example, I am going to walk through a fake example,
and define some terms. I have a made up program called `fetch`.

#shell(
  ```
  fetch v1.0 - A program to fetch files from the internet

  fetch [-lh] [--verbose=low] [url, ...]

  ```,
  [After running `fetch`, we get this output.],
)

The first set of options `[-lh]` are what I call flags. They are put after the
name of the program and alter its behaviour. For example, in this case `-h` might
cause the program to print the help, and `-l` might create a log file. Secondly
we have `[--verbose=low]`. This is what I call an option - it takes an argument
or parameter after you have called `--verbose`. In the example, it is `low`. If
you call `--verbose` by itself, there will be an error. Lastly we have what are
called positional arguments. Usually positional arguments are at the end of the
program call, and generally point to a file of some sort. All together:

#shell(
  ```bash
  fetch -l --verbose=high "www.example.com/file.txt"
  ```,
  [A made up example where an optional argument `--verbose` is used, and a
    positional argument which is a URL. `-l` creates a log file of the output.],
)

== How to get help

=== `man`

`man`, which is short for 'manual' shows a page on your terminal that you can
scroll through. It lists all the flags, options, and behaviour of the program.
The output of this program can be quite overwhelming, so let's take an example.

#shell(
  ```bash
  man ls
  ```,
  [Getting help for the `ls` command using the `man` command.],
)

The `man` page for `ls` is really long, perhaps unexpectedly for such a
seemingly simple command. We will break down each relevant section.

==== Synopsis

An overview of the tool. It gives a very brief overview of how the tool is used.
For `ls`
we can see there are a _lot_ of flags, but only a few (two) options. There's
also one or more positional arguments - so we can actually pass as many paths as
we like to `ls`, that's kind of interesting.

#figure(
  image("./images/ls_man.png", width: 80%),
  caption: [A screenshot of `man ls` on my Mac.],
)

==== Description

The description gives us an overview of the most important information, then
proceeds to list every single flag and option, and tells us what they do. You
might want to spend a little time in the `man` page looking at the options - you
will always find something new and interesting. You will notice that there is a
lot of jargon; computer science and file system terms which you will have to
look up and get used to. In particular in `ls` there is a whole section on the
so called 'long format' which is important as it's very widely used.

==== Examples

You will have to scroll all the way to the end of the `man` page to see the
examples, but they are worth looking at, as they will give you an idea of how
the developers use the tool.

=== `-h/--help`

It is worth noting that while `man` is somewhat standardised in its help, this
next part is very variable and depends on the type of program you are looking
at. In _general_ (but not always) you can get help in another way by passing the `-h` flag
(short version usually has a single dash) *or* the `--help` flag (long version
usually has two dashes). If the program recognises these flags, they will print
help to the terminal. Sometimes if you run a program without any arguments at
all, it will print the help too.

Many of the base tools you have on your shell will _not_ recognise `-h/--help`.
Many tools you will download later on _will_ recognise `-h/--help`. It's tool
specific, so be wary.
