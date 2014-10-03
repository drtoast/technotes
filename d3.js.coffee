# Tutorials
# http://www.recursion.org/d3-for-mere-mortals/
# http://bost.ocks.org/mike/d3/workshop/

# Examples
# https://github.com/mbostock/d3/wiki/Gallery

# Joins
# http://bost.ocks.org/mike/join/

# SVG reference
# https://developer.mozilla.org/en-US/docs/SVG

# SELECTIONS
d3.selectAll("p").style("color", "white")
d3.select("body").style("background-color", "black")

# DYNAMIC PROPERTIES
d3.selectAll("p").style "color", (d, i) ->
  i % 2 ? "#fff" : "#eee"

# BOUND DATA
d3.selectAll("p")
  .data [4, 8, 15, 16, 23, 42]
  .style "font-size", (d) -> d + "px"

# ENTER AND EXIT
d3.select("body").selectAll("p")
    .data [4, 8, 15, 16, 23, 42]
  .enter().append("p")
    .text (d) -> "I’m number " + d + "!"

# Update…
p = d3.select("body").selectAll("p")
  .data [4, 8, 15, 16, 23, 42]
  .text(String)

# Enter…
p.enter().append("p")
  .text(String)

# Exit…
p.exit().remove()
