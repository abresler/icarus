// Template._assetAllocation.rendered = function() {

// 	var width = 960,
// 	    height = 400,
// 	    radius = Math.min(width, height) / 1.9,
// 	    spacing = .08;

// 	var color = d3.scale.linear()
// 	    .range(["hsl(-180,50%,50%)", "hsl(180,50%,50%)"])
// 	    .interpolate(interpolateHsl);

// 	var arc = d3.svg.arc()
// 	    .startAngle(0.0)
// 	    .endAngle(function(d) { return (d.value * 2 * Math.PI); })
// 	    .innerRadius(function(d) { return d.index * radius; })
// 	    .outerRadius(function(d) { return (d.index + spacing) * radius; });

// 	var arc22 = d3.svg.arc()
// 	    .startAngle(0.0)
// 	    .endAngle(function(d) { return (d.value * 2 * Math.PI); })
// 	    .innerRadius(function(d) { return ; })
// 	    .outerRadius(function(d) { return (d.index + spacing) * radius; });
	    
// 	var formatter = d3.format(".2%");

// 	var svg = d3.select("#analytics-asset-allocation").append("svg")
// 	    .attr("width", width)
// 	    .attr("height", height)
// 	    .append("g")
// 	    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
		
// 		var gradient = svg
// 	    .selectAll("linearGradient").data(fields).enter()
// 	    .append("linearGradient")
// 	    .attr("y1", "0%")
// 	    .attr("y2", "0%")
// 	    .attr("x1", "0%")
// 	    .attr("x2", "100%")
// 	    .attr("gradientUnits", "objectBoundingBox")
// 	    .attr('id', function(d){return "gradient-"+d.index*10})
// 	    gradient.append("stop")
// 		.attr("offset", "0%")
// 		.attr("stop-opacity", "1")
// 	    .attr("stop-color", function(d){return color(d.index);});
// 	    gradient.append("stop")
// 		.attr("offset", function(d){return 30+"%"})
// 		.attr("stop-opacity", ".5")
// 		.attr("stop-color", function(d){return color(d.index);});
// 	    gradient.append("stop")
// 		.attr("offset",  function(d){return 80+"%"})
// 		.attr("stop-opacity", "0.7")
// 		.attr("stop-color", function(d){return color(d.index);});
		
		
// 		var field = svg.selectAll("g")
// 	    .data(fields)
// 		.enter().append("g");

// 		field.append("path");
// 		field.append("path").attr('id', 'innerPath');
// 		field.append("rect");
// 		field.append("text");
// 		field.append("circle");	

			
// 		d3.transition().duration(0).each(tick);
// 		d3.select(self.frameElement).style("height", height + "px");

// 	function tick() {
// 		field = field
//       .each(function(d) { this._value = d.value; })
// 	  .data(fields)
//       .each(function(d) { d.previousValue = this._value; });

//       // field.select("circle")
//       // .attr("cx", 0)
//       // .attr("cy", 0)
//       // .attr("r", 100)
//       // .attr("fill", function(d) { return color(d.index); })

//       field.select("path")
// 	    .transition()
// 	      .ease("linear")
// 	      .attrTween("d", arcTween)
// 		  .style("opacity", function(d) { return .7; })
// 	      .style("fill", function(d) { return color(d.index); });


//       field.select("path#innerPath")
//       	.attr('d', arc22)
// 		  .style("opacity", function(d) { return .7; })
// 	      .style("fill", function(d) { return color(d.index); });

// 	  field.select("text")
// 		.attr("x", function(d) { return -( ((fields().length /10) + spacing) * radius) - 50  ; })
// 		.attr("y",function(d) { return -(((d.index + spacing) * radius)) + 20; })
// 	    .text(function(d) { return formatter(d.value) + ' ' + d.type })
// 		.style("font-size","15px")
// 	    .transition()
// 	      .ease("linear")
// 	      .attr("transform", function(d) {
// 	        return "rotate(0)"
// 	            + "translate(-250,0)"
// 	            + "rotate(0)"
// 	      });

// 		field.select("rect")
// 		.attr("x", function(d) { return  -( ((fields().length /10) + spacing) * radius) - 100  ; })
// 		.attr("y",function(d) { return -(((d.index + spacing) * radius)); })
// 		.attr("height",function(d) { return ((d.index + spacing) * radius)-(d.index * radius)})
// 		.attr("width",function(d) { return  ((fields().length /10) + spacing) * 100;})
// 		.text(function(d) { return formatter(d.value); })
// 		.attr("fill", function(d){return "url(#gradient-"+ d.index*10 +")"})
// 	    .transition()
// 		.attr("transform", function(d) {
// 	        return "rotate(0)"
// 			+ "translate(-250,5)"
// 			+ "rotate(0)"
// 		});
		
// 		  setTimeout(tick, 3000);
// 	}

// 	function arcTween(d) {
// 	  var i = d3.interpolateNumber(d.previousValue, d.value);
// 	  return function(t) { d.value = i(t); return arc(d); };
// 	}

// 	function arcTween2(d) {
// 	  var i = d3.interpolateNumber(d.previousValue, d.value);
// 	  return function(t) { d.value = i(t); return arc2(d); };
// 	}

// 	function fields() {
// 	   return [
// 	    {index: .5,  value: 0.75, type: 'loan'},
// 	    {index: .6,  value: 0.25, type: 'equity'}
// 	  ];
// 	}

// 	// Avoid shortest-path interpolation.
// 	function interpolateHsl(a, b) {
// 	  var i = d3.interpolateString(a, b);
// 	  return function(t) {
// 	    return d3.hsl(i(t));
// 	  };
// 	}

// }
