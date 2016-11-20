<?php
# Author: Chris Robertson <electronicsleep@gmail.com>
# Git: https://github.com/electronicsleep/MediaPi
# Date: 03/15/2016
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

$file = 'posts.txt';
$posts = file_get_contents($file);
$num_good = substr_count($posts, "Rating: good");
$num_bad = substr_count($posts, "Rating: bad");

?>


<!DOCTYPE html>
<meta charset="utf-8">
<?php
print "<title>Rating: Good $num_good vs bad $num_bad comments</title>";
?>
<style>

path {
  fill: #ccc;
  stroke: #333;
  stroke-width: 1.5px;
  transition: fill 250ms linear;
  transition-delay: 150ms;
}

path:hover {
  fill: #999;
  stroke: #000;
  transition-delay: 0;
}

</style>
<body>
<script src="d3.v3.min.js"></script>
<script>


var data = [<?php echo "$num_good , $num_bad"; ?>];

var width = 360,
    height = 300;

var outerRadius = height / 2 - 20,
    innerRadius = outerRadius / 3,
    cornerRadius = 10;

var pie = d3.layout.pie()
    .padAngle(.02);

var arc = d3.svg.arc()
    .padRadius(outerRadius)
    .innerRadius(innerRadius);

var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

svg.selectAll("path")
    .data(pie(data))
  .enter().append("path")
    .each(function(d) { d.outerRadius = outerRadius - 20; })
    .attr("d", arc)
    .on("mouseover", arcTween(outerRadius, 0))
    .on("mouseout", arcTween(outerRadius - 20, 150));

function arcTween(outerRadius, delay) {
  return function() {
    d3.select(this).transition().delay(delay).attrTween("d", function(d) {
      var i = d3.interpolate(d.outerRadius, outerRadius);
      return function(t) { d.outerRadius = i(t); return arc(d); };
    });
  };
}

</script>

