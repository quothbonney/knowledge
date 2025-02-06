/* Blocks */
#let classes = ("Definition", "Lemma", "Theorem", "Corollary")
#let h1_marker = counter("h1")
#let h2_marker = counter("h2")

#import "@preview/whalogen:0.2.0": ce
#import "@preview/codly:1.1.1": codly-init, codly
#import "@preview/codly-languages:0.1.1": codly-languages
#import "@preview/ctheorems:1.1.3": thmenv, thmrules, thmplain

#let note_block(body, class: "Block", fill: rgb("#FFFFFF"), stroke: rgb("#000000"), title: none) = {
  let block_counter = counter(class)

  locate(loc => {
    let serial_num = str(
      //h1_marker.at(loc).last(),
      //h2_marker.at(loc).last(),
      block_counter.at(loc).last() + 1
    )

    let serial_label = label(class + " " + serial_num)
        
    block(
      fill: fill,
      width: 100%,
      inset: (top: 24pt, rest: 8pt), // Increased top padding for title
      radius: 4pt,
      stroke: stroke,
    )[
      #place(
        top + right,
        dy: -16pt,
        dx: -8pt,
        text(12pt)[#smallcaps[#class #serial_num] #serial_label #block_counter.step()]
      )
      #if title != none {
        place(
          top + left,
          dy: -16pt,
          dx: 0pt,
          text(12pt, weight: "bold")[#title]
        )
        v(4pt)
      }
      #body
    ]
  })
}

#let boxnumbering = "1"
#let boxcounting = "heading"

// Block styles
#let definition(body, title: none) = note_block(
  body, 
  class: "Definition", 
  fill: rgb("#F3F7ED"),  // Light olive color
  stroke: rgb("#98B475"),  // Darker olive for border
  title: title
)

#let example(body, title: none) = note_block(
  body, 
  class: "Example", 
  fill: rgb("#F7FBFC"), 
  stroke: rgb("#769FCD"),
  title: title
)

#let theorem(body, title: none) = note_block(
  body, 
  class: "Theorem", 
  fill: rgb("#FEF2F4"), 
  stroke: rgb("#EE6983"),
  title: title
)

#let lemma(body, title: none) = note_block(
  body, 
  class: "Lemma", 
  fill: rgb("#FFF4E0"), 
  stroke: rgb("#F4B183"),
  title: title
)

#let corollary(body, title: none) = note_block(
  body, 
  class: "Corollary", 
  fill: rgb("#F7FBFC"), 
  stroke: rgb("#769FCD"),
  title: title
)

/* Figures */
#let notefig(path, width: 100%) = {
  let figure_counter = counter("Figure")
  
  locate(loc => {
    let serial_num = (
      h1_marker.at(loc).last(),
      h2_marker.at(loc).last(),
      figure_counter.at(loc).last() + 1
    ).map(str).join(".")

    let serial_label = label("Figure" + " " + serial_num)

    block(
      width: 100%,
      inset: 8pt,
      align(center)[#image(path, width: width)]
    )

    set align(center)
    text(12pt, weight: "bold")[Figure #serial_num #serial_label #figure_counter.step()]
  })
}

/* Proofs */
#let proof(body) = {
  [*#smallcaps("Proof"): *]
  [#body]
  align(right)[*End of Proof*]
}

#let remark(body) = {
  [*#smallcaps("Remark"): *]
  [#body]
}


/* References */
#let refto(class_with_serial_num, alias: none) = {
  if alias == none {
    link(label(class_with_serial_num), [*#class_with_serial_num*])
  } else {
    link(label(class_with_serial_num), [*#alias*])
  }
}

/* Headings */
#let set_headings(body) = {
  set heading(numbering: "1")
  
  show heading.where(level: 1): it => {
    for class in classes { counter(class).update(0) }
    counter("h2").update(0)
    counter("Figure").update(0)

    set text(18pt, weight: "bold")
    block[#counter(heading).display() #it.body]
    v(15pt)
    h1_marker.step()
  }

  show heading.where(level: 2): it => {
    set text(15pt, weight: "bold")
    block[#it]
    h2_marker.step()
  }

  show heading.where(level: 3): it => {
    set text(13pt, weight: "bold")
    block[#it]
  }
  
  body
}

/* Main template */
#let lecture_notes(title, author, date, body) = {
  set document(title: title, author: author)
  set page(
    paper: "us-letter",
    margin: (top: 1.5in, bottom: 1in, left: 1in, right: 1in),
    header: locate(loc => {
      if calc.odd(loc.page()) {
        align(right)[
          #text(style: "italic")[#title]
          #v(-6pt)
          #line(length: 40%)
        ]
      } else {
        align(left)[
          #text(style: "italic")[#title]
          #v(-6pt)
          #line(length: 40%)
        ]
      }
    }),
    footer: locate(loc => {
      align(center)[#loc.page()]
    })
  )
  
  set par(justify: true)
  show math.equation.where(block: true): it => block(
    width: 100%,
    align(center, it)
  )

  // Enhanced title section
  block(width: 100%, inset: (y: 10pt))[
    #align(center)[
      #block(width: 100%, inset: (bottom: 8pt))[
        #text(24pt, weight: "bold")[#title]
      ]
      //#v(2pt)
      //#line(length: 60%, stroke: 1pt)
      //#v(16pt)
      #text(14pt, style: "italic")[#author - #date]
    ]
  ]
  
  v(2em)

  // Main content
  set_headings(body)
}
