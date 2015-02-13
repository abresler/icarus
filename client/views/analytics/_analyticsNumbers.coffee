Template._analyticsNumbers.rendered = ->
	rowHeight = d3.select('#analytics-allocation').property('clientHeight')
	d3.select('#analytics-numbers').style('height', rowHeight+'px')

	