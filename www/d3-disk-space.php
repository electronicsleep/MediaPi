<!--
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license
-->
<!DOCTYPE html>
<meta charset="utf-8">
<title>Video Disk Space</title>
<body>
<script src="d3.v3.min.js"></script>
<script>

var color = d3.scale.quantize()
    .range(["#156b87", "#876315", "#543510", "#872815"]);

var size = 360;

var pack = d3.layout.pack()
    .sort(null)
    .size([size, size])
    .value(function(d) { return d.radius * d.radius; })
    .padding(5);

var svg = d3.select("body").append("svg")
    .attr("width", size)
    .attr("height", size);

d3.csv("videos.csv", type, function(error, exoplanets) {
  exoplanets.sort(function(a, b) {
    return isFinite(a.distance) || isFinite(b.distance)
        ? a.distance - b.distance
        : 0;
  });

  color.domain(d3.extent(exoplanets, function(d) { return d.radius; }));

  svg.selectAll("circle")
      .data(pack.nodes({children: exoplanets}).slice(1))
    .enter().append("circle")
      .attr("r", function(d) { return d.r; })
      .attr("cx", function(d) { return d.x; })
      .attr("cy", function(d) { return d.y; })
      .style("fill", function(d) { return color(d.radius); })
    .append("title")
      .text(function(d) {
        return d.name + "\nRadius: " + d.radius;
      });
});

function type(d) {
  d.radius = +d.radius;
  d.distance = d.distance ? +d.distance : Infinity;
  return d;
}

d3.select(self.frameElement).style("height", size + "px");

</script>
