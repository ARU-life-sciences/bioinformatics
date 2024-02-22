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
  show raw.where(block: true): block.with(fill: luma(240), inset: 10pt, radius: 4pt)

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
