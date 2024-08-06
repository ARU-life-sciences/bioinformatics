// general formatting for all the documents in this
// repository

// The formatter will apply all the correct
// formats that I like across the whole document
// when called.
// It must be called like this:
// #show: doc => formatter(doc)
#let formatter(doc) = {
  // links are underlined
  show link: underline
  // figure captions have reduced size
  show figure.caption: it => [#text(size: 10pt, it)]

  // numbered sections
  set heading(numbering: "1.")

  // Display inline code in a small box
  // that retains the correct baseline.
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  // Display block code in a larger block
  // with more padding.
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )

  // place shell captions at the top. All other captions will be at
  // the bottom
  show figure.where(kind: "Shell"): set figure.caption(position: top)

  // add a table of contents at the top
  outline(indent: auto)

  // and return the document
  doc
}

// shell adds a shell class to a figure basically
#let shell(block, caption) = {
  figure(block, caption: caption, kind: "Shell", supplement: "Shell")
}

// add a bit to the top with my name and stuff
// other authors can be added too.
#let conf(title: none, authors: (), doc) = {
  set align(center)
  text(17pt, title)

  let count = authors.len()
  let ncols = calc.min(count, 3)

  grid(columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      *#author.name* \
      #author.affiliation \
      #link("mailto:" + author.email)
    ]))

  set align(left)
  columns(1, doc)
}

// https://github.com/lkoehl/typst-boxes/blob/main/lib.typ
#let box-colors = (
  default: (stroke: luma(70), fill: white, title: white),
  red: (stroke: rgb(237, 32, 84), fill: rgb(253, 228, 224), title: white),
  green: (stroke: rgb(102, 174, 62), fill: rgb(235, 244, 222), title: white),
  blue: (stroke: rgb(29, 144, 208), fill: rgb(232, 246, 253), title: white),
  yellow: (stroke: rgb(255, 255, 102), fill: rgb(255, 255, 204), title: black),
)

#let colorbox(
  title: none,
  box-colors: box-colors,
  color: "default",
  radius: 2pt,
  width: auto,
  body,
) = {
  return block(
    fill: box-colors.at(color).fill,
    stroke: 2pt + box-colors.at(color).stroke,
    radius: radius,
    width: width,
  )[
    #if title != none [
      #block(
        fill: box-colors.at(color).stroke,
        inset: 8pt,
        radius: (top-left: radius, bottom-right: radius),
      )[
        #text(fill: box-colors.at(color).title, weight: "bold")[#title]
      ]
    ]

    #block(
      width: 100%,
      inset: (
        x: 8pt,
        bottom: 8pt,
        top: if title == none {
          8pt
        } else {
          0pt
        },
      ),
    )[
      #body
    ]
  ]
}

// textbox for further information
#let further(title: "Further reading...", inner) = {
  align(
    left,
    colorbox(
      title: title,
      color: "green",
      width: 90%,
      radius: 4pt,
      align(
        left,
        [
          #inner
        ],
      ),
    ),
  )
}

#let watchout(title: none, inner) = {
  align(
    center,
    colorbox(
      title: title,
      color: "red",
      width: 70%,
      align(
        left,
        [
          #inner
        ],
      ),
    ),
  )
}

// a function for a question textbox
#let question(title: none, inner) = {
  align(
    center,
    colorbox(
      title: title,
      color: "yellow",
      width: 70%,
      align(
        left,
        [
          #inner
        ],
      ),
    ),
  )
}

// https://github.com/typst/typst/issues/1278
#let my_pagebreak(n_cols: 2) = [
  #context [
    #let width_page = page.width
    #let width_col = width_page / n_cols
    #let x_init = here().position().x
    #let n_current_col = calc.ceil(x_init / width_col)
    #let n_colbreaks_required = n_cols - n_current_col
    #text(
      1pt,
      luma(100%),
    )[#n_colbreaks_required] // The function breaks without this. Seems like an anchor for the colbreaks somehow
    #for _ in range(n_colbreaks_required) {
      colbreak()
    }
  ]
]

// create a punnett square using the alleles from two parents
// Use like this: punnett_square("Aa", "Aa")
#let punnett_square(parent1: str, parent2: str) = {
  // Extract alleles from parent genotypes
  let p1_alleles = parent1.split("").filter(x => x != "")
  let p2_alleles = parent2.split("").filter(x => x != "")

  // Determine the resulting genotypes
  let genotypes = (
    p1_alleles.at(0) + p2_alleles.at(0),
    p1_alleles.at(0) + p2_alleles.at(1),
    p1_alleles.at(1) + p2_alleles.at(0),
    p1_alleles.at(1) + p2_alleles.at(1),
  )

  // Create the Punnett square
  align(center)[
    #table(
      columns: 3,
      align: center + horizon,
      table.header(
        [],
        table.cell(colspan: 2, [Parental genotype 1 \ (#strong(parent1)) \ ]),
      ),
      table.cell(
        rowspan: 2,
        align: horizon,
        rotate(
          -90deg,
          reflow: true,
        )[Parental genotype 2 \ (#strong(parent2)) \ ],
      ),
      table.cell(inset: 1cm)[
        #genotypes.at(0)
      ], table.cell(inset: 1cm)[
        #genotypes.at(1)
      ], table.cell(inset: 1cm)[
        #genotypes.at(2)
      ], table.cell(inset: 1cm)[
        #genotypes.at(3)
      ]
    )
  ]
}

// Create a dihybrid Punnett square using two alleles from the parents
// Use like this: dihybrid_punnett_square(("Aa", "Bb"), ("Aa", "Bb"))
#let dihybrid_punnett_square(parent1: (str), parent2: (str)) = {
  // Extract alleles from parent genotypes
  // each parent is an array of strings denoting the diploid genotype for that parent
  // e.g. parent1: ("Aa", "Bb")
  // e.g. parent2: ("Aa", "Bb")
  // we need to extract the alleles so we can combine them in the resulting genotypes
  let genotype_array = ()
  for (allele1, allele2) in parent1.zip(parent2) {
    // determine the genotypes
    let genotypes = (
      allele1.at(0) + allele2.at(0),
      allele1.at(0) + allele2.at(1),
      allele1.at(1) + allele2.at(0),
      allele1.at(1) + allele2.at(1),
    )

    genotype_array.push(genotypes)
  }

  // Create the Punnett square
  // the table must have parental genotypes in the header (in our example, 4 columns)
  // and also the resulting genotypes in each row (in our example, 4 rows)
  // we enumerate the genotype array in the rows and column headers

  // the number of rows and columns are equal
  let no_cols_rows = genotype_array.at(0).len() + 1

  // join two strings together
  let join = (x, y) => x + y


  // make it so we have a 2D array of rows
  let table_rows = ()
  let row = ()

  for gamete1 in genotype_array.at(0) {
    for gamete2 in genotype_array.at(1) {
      row.push(
        table.cell(inset: 1cm)[
          #join(gamete1, gamete2)
        ],
      )
    }
    if row.len() == no_cols_rows - 1 {
      table_rows.push(row)
      row = ()
    }
  }

  // create the table
  align(center)[
    #table(
      columns: no_cols_rows,
      rows: no_cols_rows,
      align: center + horizon,
      table.header(
        [],
        table.cell(
          colspan: no_cols_rows - 1,
          [Parental genotypes 1 \ (#strong(genotype_array.at(0).join(" "))) \ ],
        ),
      ),
      table.cell(
        rowspan: no_cols_rows - 1,
        align: horizon,
        rotate(
          -90deg,
          reflow: true,
        )[Parental genotypes 2 \ (#strong(genotype_array.at(1).join(" "))) \ ],
      ),
    // now complete the cells with the resulting genotypes which will
    // be a combination of the alleles from the two parents. This will require
    // pasting every combination of genotype_array.at(0) and genotype_array.at(1)
    ..for row in table_rows {
      row
    }
  )]
}
