#import "conf.typ" : conf
// #import "@preview/cetz:0.2.2"
#import "@preview/plotst:0.2.0": *
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

#let print(desc: "", content) = {
  desc
  repr(content)
  [ \ ]
}
#let scatter_plot_test() = {

  let gender_data = (
    ("w", 1), ("w", 3), ("w", 5), ("w", 4), ("m", 2), ("m", 2), ("m", 4), ("m", 6), ("d", 1), ("d", 9), ("d", 5), ("d", 8), ("d", 3), ("d", 1)
  )
  let y_axis = axis(min: 0, max: 11, step: 1, location: "left", helper_lines: true, invert_markings: false, title: "foo", value_formatter: "{}€")

  let y_axis_right = axis(min: 1, max: 11, step: 1, location: "right", helper_lines: false, invert_markings: false, title: "foo", stroke: 7pt + red, show_arrows: false, value_formatter: i => datetime(year: 1984, month: 1, day: i).display("[day].[month]."))
  let gender_axis_x = axis(values: ("", "m", "w", "d"), location: "bottom", helper_lines: true, invert_markings: false, title: "Gender", show_arrows: false)
  let pl = plot(data: gender_data, axes: (gender_axis_x, y_axis, y_axis_right))
  scatter_plot(pl, (100%,50%))
  let data = (
    (0, 0), (2, 2), (3, 0), (4, 4), (5, 7), (6, 6), (7, 9), (8, 5), (9, 9), (10, 1)
  )
  let x_axis = axis(min: 0, max: 11, step: 2, location: "bottom")
  let y_axis = axis(min: 0, max: 11, step: 2, location: "left", helper_lines: false, show_values: false)
  let pl = plot(data: data, axes: (x_axis, y_axis))
  scatter_plot(pl, (100%, 25%))
}







// HACK: самый востребованный вариант
#let graph_plot_test() = {
    let data = (
      (0, 4), (2, 2), (3, 0), (4, 4), (5, 7), (6, 6), (7, 9), (8, 5), (9, 9), (10, 1)
    )
    let data2 = (
      (0, 0), (2, 2), (3, 1), (4, 4), (5, 2), (6, 6), (7, 5), (8, 7), (9, 10), (10, 3)
    )
    let x_axis = axis(min: 0, max: 11, step: 2, location: "bottom")
    let y_axis = axis(min: 0, max: 11, step: 2, location: "left", helper_lines: false)
    let pl = plot(data: data, axes: (x_axis, y_axis))
    graph_plot(pl, (100%, 25%), markings: [])
    graph_plot(pl, (100%, 25%), markings: [ #circle(radius: 2pt, fill: black) ])
    graph_plot(pl, (100%, 25%), rounding: 30%, caption: "Graph Plot with caption and rounding", markings: [#circle(radius: 3pt, fill: black)])
}





#let histogram_test() = {
  let data = (
    18000, 18000, 18000, 18000, 18000, 18000, 18000, 18000, 18000, 18000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000,28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 35000, 46000, 75000, 95000
  )
  let classes = class_generator(10000, 50000, 4)
  classes.push(class(50000, 100000))
  classes = classify(data, classes)
  let x_axis = axis(min: 0, max: 100000, step: 10000, location: "bottom")
  let y_axis = axis(min: 0, max: 31, step: 5, location: "left", helper_lines: true)
  let pl = plot(data: classes, axes: (x_axis, y_axis))
  histogram(pl, (100%, 40%), stroke: black, fill: (purple, blue, red, green, yellow))
}

#let histogram_test_2() = {
  let classes = ()
  classes.push(class(11, 13))
  classes.push(class(13, 15))
  classes.push(class(1, 6))
  classes.push(class(6, 11))
  classes.push(class(15, 30))
  
  let data = ((20, 2), (30, 7), (16, 12), (40, 13), (5, 17))

  let x_axis = axis(min: 0, max: 31, step: 1, location: "bottom", show_markings: false)
  let y_axis = axis(min: 0, max: 41, step: 5, location: "left", helper_lines: true)
  
  classes = classify(data, classes)
  let pl = plot(axes: (x_axis, y_axis), data: classes)
  histogram(pl, (100%, 40%))
}

#let pie_chart_test() = {
  show: r => columns(2, r)
  let data = ((10, "Male"), (20, "Female"), (15, "Divers"), (2, "Other"))
  let data2 = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)

  let p = plot(data: data)
  pie_chart(p, (100%, 20%), display_style: "legend-inside-chart")
  pie_chart(p, (100%, 20%), display_style: "hor-chart-legend")
  pie_chart(p, (100%, 20%), display_style: "hor-legend-chart")
  pie_chart(p, (100%, 20%), display_style: "vert-chart-legend")
  pie_chart(p, (100%, 20%), display_style: "vert-legend-chart")
}

#let bar_chart_test() = {
  let data = ((10, "Monday"), (5, "Tuesday"), (15, "Wednesday"), (9, "Thursday"), (11, "Friday"))

  let y_axis = axis(values: ("", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"), location: "left", show_markings: true)
  let x_axis = axis(min: 0, max: 20, step: 2, location: "bottom", helper_lines: true)

  let pl = plot(axes: (x_axis, y_axis), data: data)
  bar_chart(pl, (100%, 33%), fill: (purple, blue, red, green, yellow), bar_width: 70%, rotated: true)

  let data_2 = ((20, 2), (30, 7), (16, 12), (40, 13), (5, 17))
  let y_axis_2 = axis(min: 0, max: 41, step: 5, location: "left", show_markings: true, helper_lines: true)
  let x_axis_2 = axis(min: 0, max: 21, step: 1, location: "bottom")
  let pl_2 = plot(axes: (x_axis_2, y_axis_2), data: data_2)
  bar_chart(pl_2, (100%, 60%), bar_width: 100%)
}

// TODO
#let overlay_test() = {
    let data_scatter = (
      (0, 0), (2, 2), (3, 0), (4, 4), (5, 7), (6, 6), (7, 9), (8, 5), (9, 9), (10, 1)
    )
    let data_graph = (
        (0, 3), (1, 5), (2, 1), (3, 7), (4, 3), (5, 5), (6, 7),(7, 4),(11, 6)
      )
    let x_axis = axis(min: 0, max: 11, step: 2, location: "bottom")
    let y_axis = axis(min: 0, max: 11, step: 2, location: "left", helper_lines: false)
    let pl_scatter = plot(data: data_scatter, axes: (x_axis, y_axis))
    let scatter_display = scatter_plot(pl_scatter, (100%, 25%), stroke: red)
    let pl_graph = plot(data: data_graph, axes: (x_axis, y_axis))
    let graph_display = graph_plot(pl_graph, (100%, 25%), stroke: blue)
    scatter_display
    graph_display
    overlay((scatter_display, graph_display), (100%, 25%))

    x_axis = axis(min: 0, max: 11, step: 2, location: "bottom", show_values: false)
    y_axis = axis(min: 0, max: 11, step: 2, location: "left", show_values: false)
    let ice = (data: ((0,0),(3,3),(0,10)), axes: (x_axis, y_axis))
    let a = graph_plot(ice, (100%, 25%), fill: blue.lighten(50%), markings: none, stroke: none, caption: "foo")
    let water = (data: ((0,0),(3,3),(10,7), (10,0)), axes: (x_axis, y_axis))
    let b = graph_plot(water, (100%, 25%), fill: blue, markings: none, stroke: none)
    let steam = (data: ((3,3),(10,7),(10,10),(0,10)), axes: (x_axis, y_axis))
    let c = graph_plot(steam, (100%, 25%), fill: yellow, markings: none, stroke: none)
    overlay((a, b, c), (50%, 25%))
}

#let radar_test() = {
  let data = (
    (0,6),(1,7),(2,5),(3,4),(4,4),(5,7),(6,6),(7,6),
  )
  let y_axis = axis(min:0, max: 8, location: "left", helper_lines: true)
  let x_axis = axis(min:0, max: 8, location: "bottom")
  
  let pl = plot(data: data, axes: (x_axis, y_axis))
  radar_chart(pl, (60%,60%))
}

// BUG: хз почему но оно не работает, тк я все эти графики взял тупо с официального примера на github 
// проблема не во мне
// #let function_test() = {
//   let data = function_plotter(x => {2*(x*x) + 3*x + 3}, 0, 8.3, precision: 100)
//   let data2 = function_plotter(x => {1*(x*x) + 3*x + 3}, 0, 11.4, precision: 100)
//   let x_axis = axis(min: 0, max: 20, step: 1, location: "bottom")
//   let y_axis = axis(min: 0, max: 151, step: 50, location: "left", helper_lines: true)
//   let p1 = graph_plot(plot(axes: (x_axis, y_axis), data: data), (100%, 50%), markings: [], stroke: red)
//   let p2 = graph_plot(plot(axes: (x_axis, y_axis), data: data2), (100%, 50%), markings: [], stroke: green)
//   overlay((p1, p2), (100%, 50%))
// }

// BUG: аналогично предыдущему багу
// #let box_plot_test() = {
//   box_plot(box_width: 70%, pre_calculated: false, plot(axes: (
//   axis(values: ("", "(a)", "(b)", "(c)"), location: "bottom", show_markings: false),
//   axis(min: 0, max: 10, step: 1, location: "left", helper_lines: true),
// ),
//   data:((1, 3, 4, 4, 5, 6, 7, 8), (1, 3, 4, 4, 5, 7, 8), (1, 3, 4, 5, 7))
// ), (100%, 40%), caption: none)
// }

// BUG: аналогично предыдущему багу
// #let cumsum_test() = {
//   datetime(year: 2023, month: 1, day: 20) - datetime.today()
//   let data = range(1,31).map(i=> (datetime(year: 2023, month: 1, day: i),2))
//   let dates = data.map(it => it.at(0))
//   let newdata = ()
//   let sum = 0
//   for d in data {
//     sum += d.at(1)
//     newdata.push((d.at(0).display(), sum))
//   }
//   let _ = newdata.remove(0)
//   let x_axis = axis(values: dates.map(it=> it.display()), location: "bottom")
//   let y_axis = axis(min: 0, max: sum, step: 10, location: "left")
//   graph_plot(plot(axes: (x_axis, y_axis), data: newdata), (100%, 50%), markings: [])
// }


#let paper_test() = {
  set par(justify: true)
  pagebreak()
  [
    #set align(center)
    = This is my paper
    #set align(left)
    #show: r => columns(2, r)
    #lorem(100)
    == Scatter plots
    #lorem(50)
    #{
      let data = (
        (0, 0), (1, 2), (2, 4), (3, 6), (4, 8), (5, 3), (6, 6),(7, 9),(11, 12)
      )
      let x_axis = axis(min: 0, max: 11, step: 1, location: "bottom")
      let y_axis = axis(min: 0, max: 13, step: 2, location: "left", helper_lines: true)
      let p = plot(data: data, axes: (x_axis, y_axis))
      scatter_plot(p, (100%, 20%))
    }
    == Histograms
    #lorem(150)
    #{
      let data = (
        18000, 18000, 18000, 18000, 18000, 18000, 18000, 18000, 18000, 18000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000,28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 28000, 35000, 46000, 75000, 95000
      )
      let classes = class_generator(10000, 50000, 4)
      classes.push(class(50000, 100000))
      classes = classify(data, classes)
      
      let x_axis = axis(min: 0, max: 100000, step: 20000, location: "bottom", show_markings: false, title: "Wert x", )
      
      let y_axis = axis(min: 0, max: 26, step: 3, location: "left", helper_lines: true, title: "Wert y und anderes Zeug", )
      let pl = plot(data: classes, axes: (x_axis, y_axis))
      histogram(pl, (100%, 20%), stroke: black, fill: gray)
    }

    == Pie charts
    #{
      lorem(120)
      let data = ((10, "Male"), (20, "Female"), (15, "Divers"), (2, "Other"))
      let pl = plot(data: data)
      pie_chart(pl, (100%, 20%), display_style: "hor-chart-legend")
    }
    #{
      let data = ((5, "0-18"), (9, "18-30"), (25, "30-60"), (7, "60+"))
      let pl = plot(data: data)
      pie_chart(pl, (100%, 20%), display_style: "hor-chart-legend")
      lorem(200)
    }
    == Bar charts
    #{
      lorem(50)
      let data = ((10, "Monday"), (5, "Tuesday"), (15, "Wednesday"), (9, "Thursday"), (11, "Friday"))

      let y_axis = axis(values: ("", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"), location: "left", show_markings: true)
      let x_axis = axis(min: 0, max: 20, step: 2, location: "bottom", helper_lines: true, title: "Visitors")

      let pl = plot(axes: (x_axis, y_axis), data: data)
      bar_chart(pl, (100%, 140pt), fill: (purple, blue, red, green, yellow), bar_width: 70%, rotated: true)

      let data_2 = ((20, 2), (30, 3), (16, 4), (40, 6), (5, 7))
      let y_axis_2 = axis(min: 0, max: 41, step: 10, location: "left", show_markings: true, helper_lines: true)
      let x_axis_2 = axis(min: 0, max: 9, step: 1, location: "bottom")
      let pl_2 = plot(axes: (x_axis_2, y_axis_2), data: data_2)
      bar_chart(pl_2, (100%, 120pt), fill: (purple, blue, red, green, yellow), bar_width: 70%)

      lorem(95)
    }
  ]
}

// NOTE: вызов функций описанных выше
#{
  scatter_plot_test()
  graph_plot_test()
  pagebreak()

  histogram_test()
  histogram_test_2()
  pagebreak()

  pie_chart_test()
  pagebreak()

  bar_chart_test()
  overlay_test()

  radar_test()
  // pagebreak()
  
  // BUG: не работают
  // function_test()
  // box_plot_test()
  // cumsum_test()
  
  paper_test()
}


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



