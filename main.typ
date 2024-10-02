#import "conf.typ" : conf
// #import "@preview/cetz:0.2.2"
#import "@preview/plotst:0.2.0"
#import "@preview/fletcher:0.4.5" as fletcher: diagram, node, edge

#show: conf.with(
  title: [Test Syntax],
  type: "referat",
  info: (
      author: (
        name: [Смирнова Егора Ильича],
        faculty: [КНиИТ],
        group: "251",
        sex: "male"
      ),
      inspector: (
        degree: "",
        name: ""
      )
  ),
  settings: (
    title_page: (
      enabled: true
    ),
    contents_page: (
      enabled: true
    )
  )
)

= Test math example

1. Limits & sqrt(root)

  $limits(l i m)_(n -> infinity) root(n, a) = 1$

2. Sum

  $(1 + x)^n = limits(sum)_(k = 0)^n C_n^k x^k $

3. Integral

  $integral, integral.double, integral.cont, integral.dash, integral.triple, $ ...

  $limits(integral.double)_D f(x,y) d x d y = limits(integral)_a^b d x limits(integral)_(phi_1(x))^(phi_2(x)) f(x,y) d y$

  $limits(integral)_(-pi/2)^((3pi)/2) d x limits(integral)_(-1)^(sin (x)) f(x,y) d y + limits(integral)_(pi/2)^((5pi)/2) d x limits(integral)_(sin x)^(1) f(x,y) d y$

4. Matrix, determinant, vector

  $mat(
    1, 2, 3; 
    4, 5, 6;
    7, 8, 9
  ) $

  $mat(
    1, 2, 3; 
    4, 5, 6;
    7, 8, 9;
    delim: "|"
  ) $

  $mat(
    1, 2, 3; 
    4, 5, 6;
    7, 8, 9;
    delim: "["
  ) $

  $vec(
    1, 2, 3,
    delim: "["
  )$

  $vec(
    1, 2, 3,
  )$

5. Frac

  $frac(a^2, 2) = (a^2)/2$

= Test table

#set table.hline(stroke: .6pt)
#table(
  columns: (auto, auto, auto),
  stroke: none,
  inset: 10pt,
  align: horizon,
  table.hline(),
  table.header(
    [*Something*], [*Area*], [*Parameters*],
  ),
  table.hline(),
  table.vline(x: 0),
  table.vline(x: 1),
  table.vline(x: 2),
  table.vline(x: 3),
  // image("cylinder.svg"),
  [9],
  $ pi h (D^2 - d^2) / 4 $,
  [
    $h$: height \
    $D$: outer radius \
    $d$: inner radius
  ],
  table.hline(),
  // image("tetrahedron.svg"),
  [9],
  $ sqrt(2) / 12 a^3 $,
  [$a$: edge length],

  table.hline(start: 1),
  [9],
  $ sqrt(2) / 12 a^3 $,
  [$a$: edge length],
  table.hline(),
)

= Test Graphs




= Test Diograms

// a quick and dirty horizontal arrow created as a polygon
#let block-arrow(length, width, head-length, head-width, fill) = {
  box(width: length, height: head-width, {
    polygon(
      (0%, 50% + width/2),
      (100% - head-length, 50% + width/2),
      (100% - head-length, 50% + head-width/2),
      (100%, 50%),
      (100% - head-length, 50% - head-width/2),
      (100% - head-length, 50% - width/2),
      (0%, 50% - width/2),
      stroke: none,
      fill: fill,
    )
  })
}

#diagram(
  edge-stroke: 1pt,
  node-stroke: 1pt,
  node-corner-radius: 5pt,
  edge-corner-radius: 8pt,
  mark-scale: 80%,
  {
    let start = (0, 0)
    let foo = (1, 0)
    let bar = (2, 0)
    let baz = (1, 1)
    let quux = (2, 1)
    let end = (3, 0)

    // an empty, small circular node
    let terminal(..args) = node(
      // position, and any other parameters
      ..args,
      // draw the node outline ...
      shape: circle,
      // ... with small padding ...
      inset: 3pt,
      // ... around very small invisible content
      h(1pt)
    )
    // 
    let regular(..args) = node(
      // position, and any other parameters
      ..args,
      width: 4em,
      height: 3em,
      fill: aqua,
    )
    let arrow(..args) = edge(..args, "-|>")

    terminal(start)
    regular(foo)[foo]
    regular(bar)[bar]
    regular(baz)[baz]
    regular(quux)[quux]
    terminal(end)
  
    arrow(start, foo)
    arrow(foo, bar)
    arrow(bar, end)
    arrow(start, (0.3, 0), (0.3, 1), baz)
    arrow(baz, quux)
    arrow(quux, (2.6, 1), (2.6, 0), end)

    node(
      enclose: ((1, -0.6), (2, -0.6)),
      stroke: none,
      // here we have a fixed "regular" node width
      // of 4em, so we need to extend the node
      // content's width by 2em on both sides
      pad(x: -2em, y: 2em, {
        [Tweedledee]
        block-arrow(100%, 5pt, 16pt, 14pt, red)
      })
    )

    node(
      enclose: ((1, 1.6), (2, 1.6)),
      stroke: none,
      pad(x: -2em, {
        block-arrow(100%, 5pt, 16pt, 14pt, green)
        [Tweedledum]
      })
    )
  }
)



