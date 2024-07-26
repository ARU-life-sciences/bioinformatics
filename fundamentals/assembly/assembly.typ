#import "../../typst/format.typ": conf, formatter, shell, watchout, question, my_pagebreak, further

#show: doc => conf(
  title: [Assembling genomes],
  authors: (
    (
      name: "Max Carter-Brown",
      affiliation: "Anglia Ruskin University, Wellcome Sanger Institute",
      email: "max.carter-brown@aru.ac.uk",
    ),
    (
      name: "Mark Blaxter",
      affiliation: "Wellcome Sanger Institute, University of Edinburgh",
      email: "",
    ),
  ),
  doc,
)

#show: doc => formatter(doc)

#watchout(
  [
    A Canvas quiz has been set up for this practical. We will undertake the practical in examination conditions, and you will *not be able to talk during the session*. In addition, you must only have the tabs open on your computer which are relevant to the practical. If there are any other tabs open, or you are seen to be using ChatGPT or any other LLM, you will instantly fail with a score of zero marks.

    Answer all of the questions in the yellow question boxes, these are equivalent to those on Canvas.
  ],
  title: [This practical is *assessed*],
)

= Introduction

You have the full two hours to complete this assessment, there should be plenty of time. Please read all the introductory material before starting the assessment.

In this practical assessment you will be taking a set of sequence reads derived from a mitochondrial genome, and using one of the many available genome assembly programs to "assemble" these sequence reads into a complete genome. The mitochondrial genome is circular (in animals) and ~14000 base pairs in length. It encodes 2 ribosomal RNAs and 12 or 13 proteins (depending on which species is being examined). It also encodes 20 transfer RNAs (tRNAs).

We will look at _Brugia malayi_, which is a parasitic roundworm (nematode) which infects humans, amongst other animals. The _Brugia malayi_ mitochondrial genome is a circular molecule, with 12 protein coding genes and two rRNAs, just under 13,600 base pairs in length. The sequencing reads were generated by the Blaxter lab in the Institute of Evolutionary Biology, University of Edinburgh, as part of the _Brugia malayi_ genome project.

The reads are from Sanger sequencing (or dideoxy) technology. The reads are each 300-600 bases long, and are paired-end reads from cloned inserts in plasmid vectors. This is a fairly old sequencing technology - the one that was used to assemble the original human genome - but the data is good quality. The reads have been pre-trimmed "low quality" sequence.

#figure(
  image("./images/bmalayi.gif", width: 50%),
  caption: [The _B. malayi_ mitochondrial genome showing the position of the genes in the circular molecule.],
)

= CAP3

You will use the program "CAP3" (which stands for contig assembly program). CAP was developed by Xiaoqiu Huang. It was first published in 1992 @huang1992contig. A brief description of how the program works is given below.

CAP3 is an “alignment-overlap-consensus” assembler. It first compares all the sequences to each other to identify which could possibly derive from the same portion of the genome. It then develops an overlap map of the sequences, an estimate of how the sequences could be tiled together to make an assembly. If a particular sequence could overlap two others, and these overlaps are in conflict, the program uses the quality of the alignments (length, number of identities) to choose between them. Finally, CAP3 derives a consensus sequence from the overlapped sequences, and produces a set of reports.

It is an old, and fairly naive assembler by today's comparison but it works well for the dataset that we have.

= The raw data

You should now open your data file `BM_mt.fa`. It is a fasta file, an extremely common file format in bioinformatics which we have come across before. Open your file *in a text editor*, not Word. Word will add characters to the file which will make it unreadable by the assembler.

#question(
  [
    1. What defines the fasta format?
    2. How many sequences are in the raw data file? Consider using `grep`, or another pattern matching tool.
  ],
  title: [Questions],
)

== Understanding the data

The sequences in the file are derived from performing sequencing on shotgun clones of the _B. malayi_ genome. Each clone was named "Bmmt_cl_X" where X is a number. Each clone was sequenced twice, using primers at the start and the end of the insert. One sequence will represent the forward read (`_f`), and the other the reverse read (`_r`), which will be from the opposite side of the strand.

This type of sequencing is called paired-end sequencing. Forward and reverse sequences are not present for every clone, so some clones are represented by either `_f` or `_r` reads.

Thus, for example, "Bmmt_cl_123_f" and "Bmmt_cl_123_r" form a "read pair" from each end of a single clone.

#figure(
  image("./images/frplasmid.png", width: 80%),
  caption: [How reads are designated forward or reverse in the context of sequencing.],
)

= Assembling your reads

We will use an online service that offers access to the CAP3 assembly program. In the online version, a form is used to collect your data, and the webserver then formats and executes a command on the remote computer to run the program. Once it is finished, the webserver gives you access to the output files from the analysis.

== Open a browser window and go to the PRABI CAP3 server

Open a link to the CAP3 server at PRABI-Doua (http://doua.prabi.fr/software/cap3) *in a new browser window*.

#further([The PRABI-Doua (Pôle Rhône-Alpes de Bioinformatique Site Doua) World Wide Web server - developed at the Laboratory of Biometry and Evolutionary Biology and the Institute of Biology and Chemistry of Proteins - is dedicated to molecular biology and ecology.])

== Submit your sequence data to the CAP3 server

Select all of the sequence data in FASTA format from `BM_mt.fa` and paste it into the window "Enter your sequences in FASTA format".

*_Leave the various analysis options at their default values_*.

== Select "SUBMIT"

Your data will be sent to the PRABI remote computing facility which will carry out the assembly. Please be patient while this happens: do not keep clicking on the page while it is loading. This may take up to 5 minutes depending on the server load.

= Examine your results

Several text outputs are produced.

+ *Contigs*
+ *Single sequences*
+ *Assembly details*
+ *Your sequence file*

These are all hyperlinks which link to text files. Save the files to your local workspace for examination.

== The "Contigs" file

This contains the assembled sequences in fasta format. A "contig" is a set of contiguous sequences.

#question(
  [
    3. What is the total number of contigs produced by the assembler?
    4. What is the length of the largest contig?
    5. What is the total length of the assembly?
  ],
  title: [Questions],
)

Note that each sequence line in the fasta is 60 bases long. You may wish to put into practice your BASH/shell/terminal skills. `grep` will be useful in counting contigs. `wc` will be useful in counting bases (once the headers are excluded). Of course you can count in any way you like - such as using Word tools.

#bibliography("./assembly.bib")
