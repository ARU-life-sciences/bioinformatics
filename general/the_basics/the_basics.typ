#import "../../typst/format.typ": conf, formatter, shell, question, watchout, my_pagebreak

#show: doc => conf(
  title: [The Basics],
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

= Outcomes

*By the end of this document you should be able to*:

- Open a terminal on your computer
- Understand and navigate the file system on your computer

= Setup

To make best use of bioinformatics tools we need to set our computers up
properly. We need to interact with the computer on a more basic level - we need
to use what is called a terminal. A terminal is a text based prompt where a user
can input commands and get results back. Simply put, you type text and the
results of the command you executed are either written to the screen or to a
file.

== Mac

You are in luck for this bit - all you need to do is find your terminal
application. On my machine it's here: '/System/Applications/Utilities/Terminal.app'.
Or open Spotlight (`Cmd + Space`) and search there.

== Windows

You need to #link(
  "https://learn.microsoft.com/en-us/linux/install",
)[install Windows Subsystem for Linux] (WSL). Note that Windows PowerShell is _not_ what
we want. PowerShell, although it sounds great, is not widely used at all in
bioinformatics and you will find yourself running into issues very quickly if
you use it.

If you are on Windows 10 version 2004 or higher, or Windows 11 you will need to install
WSL via PowerShell.

#shell(
  ```bash
  wsl --install
  ```,
  [Install WSL via PowerShell on a Windows machine],
)

For more instructions, please see #link("https://learn.microsoft.com/en-us/windows/wsl/install")[this link]
for the Linux distribution installation and #link("https://learn.microsoft.com/en-us/windows/terminal/install")[this link]
to install Windows Terminal. On there, it will tell you also how to set up
Ubuntu (the default Linux distribution) as your default operating system on
the terminal. You may find it easier to open the 'Ubuntu' app once installed.

== Google Chromebooks

You should have something already in-built. Check out #link("https://chromeos.dev/en/productivity/terminal")[
this link] for more information on installation. I am less confident about installation
on a Chromebook, so please refer to the link.

= The terminal and the filesystem

Go ahead and open up your new terminal. Depending on your machine you will be
running a certain kind of shell. The shell is the program you use which
interprets the commands you will be writing. It is usually BASH or ZSH, though
many shells exist (@fish_shell). Your shell will have a bit to the left of a `$`
or `>`, which might include the date, and/or your location in your file system. To
the right of the `$`/`>` is where you type your commands.

#figure(
  image("./images/fish_shell.png", width: 70%),
  caption: [My shell set up. It will be a bit fancier than yours, but it does the same
    thing.],
) <fish_shell>

When you are starting out, it is good to know where you are in your file system.
When you open up your terminal, it places you
inside your file system somewhere (usually your home directory). This is
equivalent to you opening up Finder (on a Mac) or File Explorer on Windows.
They are visual guides to where all the files on your computer are stored.
The terminal reflects this too, but uses text and not fancy graphics. We can
work out where we are in our file system by 'Printing the Working Directory'.

#shell(
  ```bash
  pwd
  ```,
  [Print the working directory by typing this command.],
)

Now we know where we are. But what is here? The next command lists files
in a directory.

#shell(
  ```bash
  ls
  ```,
  [Listing files in the directory you are in.],
)

This command should output some text which shows you what is in your directory.
It will not look like @fish_shell, but it should display the same information
that is in the 'Name' column. Commands can be modified usually with flags. Flags
are extra bits of information that you can pass to the command to modify the
output. To find out what these flags are, start by either running the program
without any flags, reading the manual using the `man` command (e.g. `man ls`),
or using the `-h`/`--help` flag (e.g. `ls -h`/`ls --help`).

#my_pagebreak()

#watchout(
  [If you run `ls` without any flags, it will just list items in the directory as described.
    If you run `ls` with `--help` it will throw an error saying it is not an option. If you run
    `ls` with `-h`, it will make output human readable - not give you the help! In this case, use `man ls`. All of this to say
    that flags are not consistent across programs. But hopefully at least one of the three methods
    described will help. Or search the internet.],
  title: [Be careful with flags],
)

#shell(
  ```bash
  # these are the same
  ls -t -h -o -r
  ls -thor
  ```,
  [Adding flags to our `ls` command modifies its behaviour. Hashed lines are
    comments, not code to be executed.],
)

You notice that I added some text there. `-t` sorts output by time. `-h` makes
the output human readable (i.e. adds K for kilobytes and M for megabytes etc).
`-o` outputs list in long format. `-r` reverse sorts, so coupled with `-t` I am
reverse sorting by time - neat right?

`ls` is a program which has the simple task of listing files. It can list
files anywhere though, not just where we happen to be. All we have to do is
point `ls` to the directory where we want it to list files. To do this, you have
to be familiar with what a file system is a bit more. In @file_system I have
made up a toy example which starts at the root of our file system and contains
different directories.

#figure(
  image("./images/filesystem.svg", width: 50%),
  caption: [My made up file system. The root (denoted by a forward slash `/`) is the origin
    of the file system, and it usually has lots of stuff in it we won't worry about.
    Under the root, we have HOME, which is our home directory (denoted by a tilde
    `~`). Under HOME are our familiar directories - where my documents live, and
    where my downloads are.],
) <file_system>

As mentioned earlier, when we open our terminal we are usually placed in our
home directory. But now I want to list the files in the directory 'above' where
I am. I want to ascend the file system tree up one level. How do I do this?
There are actually two ways in our made up example.

#shell(
  ```bash
  ls ..
  ls /
  # note you can also pass the flags like you did before
  ls -thor ..
  ```,
  [Two ways of doing the same thing. The `..` is a code for 'go up one level'. The
    `/` is the symbol for root. It so happens that when we go up one level from
    HOME, we reach the root! So these two lines of code do the same thing here. If
    you run these on your machines however, you are likely to get a different
    result as your root is likely to be many levels above your current directory.],
)

I will introduce one more command here, `cd`. `cd` changes the directory we are
currently in. We use it if we want to 'physically' travel around the file
system. Running `cd` by itself will return you to your home directory (which may
not be what you want). Usually we run `cd` with a path - that is, a pathway to
where we want to go to.

#shell(
  ```bash
  # change directory
  cd
  cd ..
  cd Documents
  ```,
  [Changing directory. The first line takes us home. The second line takes us up
    one level, and the third line takes us in to the Documents folder (provided the
    Documents folder is in the directory you are currently in!)],
)

By using these two commands (`cd` and `ls`) we can explore any part of our file
system that we have permission to view.

#shell(
  ```bash
  # this might display:
  # Documents  Downloads  Pictures
  ls
  # go into Documents
  cd Documents
  # have a look around
  ls
  # go back to where you were
  cd ..
  # go up again
  cd ..
  # have a look around
  # this might display:
  # bin  etc  HOME  lib
  ls
  ```,
  [Exploring our toy file system shown in @file_system.],
)

#question(
  [
    + List the files in your current directory.
    + List the files in the directory two levels above your current directory.
      How many files and/or directories are there?
    + Change directory to the root directory and print the working directory
      using `pwd`. What does it say?
  ],
  title: [Questions],
)

= File paths

File paths are a way of describing where a file is on your file system. They are
written as a series of directories separated by forward slashes `/`, and the
file name at the end. For example, if I have a file called `my_file.txt` in the
directory `Documents`, which is in my home directory, I can describe the path of
this file in two ways:

+ Absolute path: `/Users/mc9148/Documents/my_file.txt`
  - this type of path starts from the root of the file system.
+ Relative path: `~/Documents/my_file.txt`.
  - we start from my home directory. The `~` is a symbol which represents the home directory.
  - relative paths do not have to start from the home directory, they can start from anywhere
  but the root - e.g. `../Documents/my_file.txt` would be a relative path to my file.

We can use file paths to navigate the file system, and manipulate documents in one go.

#shell(
  ```bash
    # list files in my Documents
    ls /Users/mc9148/Documents
    # or
    ls ~/Documents

    # show the contents of my_file.txt
    cat /Users/mc9148/Documents/my_file.txt
  ```,
  [Using file paths],
)

= Tab completion

To eliminate typos and make life easier, we can use tab completion. This is a
feature which allows us to start typing a command or file path, and then press
`Tab` to complete the command or file path. If there is more than one possible
completion, pressing `Tab` twice will list the possible completions. Please do
make use of this feature as it will save you a lot of time.
