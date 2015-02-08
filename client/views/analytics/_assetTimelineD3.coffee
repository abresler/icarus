Template._assetTimeline.rendered = ->

	height = d3.select('#_assetTimeline').property('clientHeight') - 20
	width = d3.select('#_assetTimeline').property('clientWidth') - 20

	box = {s: 5}

	xAxisTransform = 20
	yAxisTransform = 60

	# temp = Properties.find
	# 	owners: 'bob' #Meteor.user()._id
	# .fetch()

	# ids = _.pluck(temp, 'zpid')

	ids = [2105388632, 87967832, 39475072]
	
	Meteor.call 'getProperties', ids, (err, res) ->
		data = [].concat(res)
		homes = []

		for d in data
			temp = _.pick(d, 'data') 
			homes.push temp.data[0]

		all = _.flatten _.pluck(homes, 'points')

		lineData = _.pluck homes, 'points'

		svg = d3.select '#_assetTimeline'
				.append('svg')
				.attr 
					height: height,
					width: width

		legend = {x: 25, y: 30, boxWidth: 120, boxHeight: homes.length * 27.5, color: 5}

		xScale = d3.time.scale()
		.domain d3.extent all, (d) -> new Date(d.x)
		.range [yAxisTransform, width - yAxisTransform]
		
		yScale = d3.scale.linear()
		.domain [d3.max(all, (d) -> d.y) + 20e3, d3.min(all, (d) -> d.y) - 20e3]
		.range [xAxisTransform, height - xAxisTransform]

		colorScale = d3.scale.category10()

		axis = svg.append 'g'
				.attr 'class', 'axis'

		xAxis = d3.svg.axis()
				.scale xScale
				.orient 'bottom'

		yAxis = d3.svg.axis()
				.scale yScale
				.ticks(8)
				.tickFormat (d) -> (d3.formatPrefix(d).scale(d) + d3.formatPrefix(d).symbol)
				.orient 'left'
				
		mousemove = ->
			bisect = d3.bisector((d) -> new Date d.x).left
			position = d3.mouse(this)
			x = xScale.invert(position[0])
			date = d3.time.format('%b %d, %Y')
			money = d3.format(',.2f')
			range = d3.extent all, (d) -> new Date(d.x)
			mid = new Date(range[1] - ((range[1] - range[0])/2))

			d3.select '#vertical-line'
				.attr 'x1', position[0]
				.attr 'x2', position[0]

			if x > mid
				d3.selectAll '.legend'
					.attr 'x', (position[0] - legend.boxWidth)
					.attr 'y', (position[1])
			else 
				d3.selectAll '.legend'
					.attr 'x', (position[0])
					.attr 'y', (position[1])

			d3.selectAll('#tracer').each (d) -> 
				set = d3.select(this).datum()
				i = bisect(set, x)
				min = new Date(d3.min(set, (d) -> d.x))
				max = new Date(d3.max(set, (d) -> d.x))

				if min < x < max
					d3.select(this)
						.style('display', null)
						.attr 'x', (position[0] - box.s)
						.attr 'y', (yScale(set[i].y) - box.s)
				else
					d3.select(this).style('display', 'none')

			d3.selectAll('#key-values').each (d, index) ->
				set = d3.select(this).datum()
				i = bisect(set, x)
				min = new Date(d3.min(set, (d) -> d.x))
				max = new Date(d3.max(set, (d) -> d.x))

				d3.select(this).attr 'y', (position[1] + ((index * 20) + box.s + legend.y))

				if x < mid
					d3.select(this)
						.attr 'x', (position[0] + (legend.boxWidth - (box.s*2)))
				else 
					d3.select(this)
						.attr 'x', (position[0] - (box.s*2))
				
				if min < x < max
					d3.select(this)
						.text('$ ' + money(set[i].y))
				else 
					d3.select(this)
						.text('No History')


			d3.selectAll('.legend#date').each (d, index) ->
				d3.select(this)
					.attr 'y', (position[1] + 12.5)
					.text date(x)

				if x < mid 
					d3.select(this).attr 'x', (position[0] + (legend.boxWidth/2))
				else
					d3.select(this).attr 'x', (position[0] - (legend.boxWidth/2))

		axis.append 'g'
			.attr 'class', 'x-axis'
			.attr 'transform', 'translate(0,' + (height-xAxisTransform) + ')'
			.attr 
				stroke: '#D1122B'
			.call xAxis

		axis.append 'g'
			.attr 'class', 'y-axis'
			.attr 'transform', 'translate(' + yAxisTransform + ',0)'
			.attr
				stroke: '#D1122B'
			.call yAxis

		grid = svg.append 'g'
			.attr 'class', 'grid'

		grid.append 'g'
			.attr 'class', 'xGrid'
			.attr 'transform', 'translate(0,' + (height-xAxisTransform) + ')'
			.call xAxis.tickSize(-height, 0, 0).tickFormat("")

		grid.append 'g'
			.attr 'class', 'yGrid'
			.attr 'transform', 'translate(' + yAxisTransform + ',0)'
			.call yAxis.tickSize(-width + (2 * yAxisTransform), 0, 0).tickFormat("")

		rect = svg.append 'g'
			.attr 'class', 'background'
			.attr 'fill', 'white'
			.attr 'opacity', 0.5

		rect.append 'rect'
			.attr 'x', yAxisTransform
			.attr 'width', width - (2 * yAxisTransform)
			.attr 'height', height - 20
		    .on "mousemove", mousemove
		    .on "mouseover", -> legendGroup.style('display', null)
		    .on "mouseout", -> legendGroup.style('display', 'none')

		vertical = svg.append('line')
			.attr 'x1', yAxisTransform
			.attr 'y1', 0
			.attr 'x2', yAxisTransform
			.attr 'y2', height - 20
			.attr 'stroke', 'red'
			.attr 'id', 'vertical-line'

		line = d3.svg.line()
			.interpolate('linear')
			.x (d) -> xScale d.x
			.y (d) -> yScale d.y

		propertiesGroup = svg.append 'g'
			.attr 'class', 'properties'

		propertiesGroup = propertiesGroup.selectAll('.properties')
			.data(lineData)
			.enter()
			.append('g')
			.attr('class', 'property')
		
		propertiesGroup.append('path')
			.attr 'class', 'line'
			.attr 'd', (d) -> line(d)
			.attr 'stroke', (d, i) -> colorScale(i%5)
			.attr 'stroke-width', '1'
			.attr 'fill', 'none'

		propertiesGroup.append 'rect'
			.attr 'class', 'legend'
			.attr 'id', 'tracer'
			.attr 'x', (d) -> (xScale(d[0].x)-box.s)
			.attr 'y', (d) -> (yScale(d[0].y)-box.s)
			.attr 'width', box.s * 2
			.attr 'height', box.s * 2
			.attr 'fill', (d, i) -> colorScale(i%5)

		legendGroup = propertiesGroup.append 'g'
			.attr 'class', 'legend-group'
			.style 'display', 'none'

		legendGroup.append 'rect'
			.attr 'class', 'legend'
			.attr 'id', 'content-box'
			.attr 'height', legend.boxHeight
			.attr 'width', legend.boxWidth
			.attr 'stroke', '#D1122B'
			.attr 'stroke-width', 1
			.attr 'fill', 'none'

		legendGroup.append 'rect'
			.attr 'class', 'legend'
			.attr 'id', 'date-box'
			.attr 'height', 20
			.attr 'width', legend.boxWidth
			.attr 'fill', '#D1122B'

		legendGroup.append 'rect'
			.attr 'class', 'legend'
			.attr 'id', 'key-colors'
			.attr 'height', 5
			.attr 'width', 5
			.attr 'fill', (d, i) -> colorScale(i%5)
			.attr 'transform', (d, i) -> 'translate(' + (box.s*2) + ',' + ((i * 20) + legend.y) + ')'

		legendGroup.append 'text'
			.attr 'class', 'legend'
			.attr 'id', 'key-values'
			.attr 'fill', (d, i) -> colorScale(i%5)
			.attr 'text-anchor', 'end'
			.style 'font-size', '12px'

		legendGroup.append 'text'
			.attr 'class', 'legend'
			.attr 'id', 'date'
			.attr 'fill', 'white'
			.attr 'text-anchor', 'middle'
			.style 'font-size', '12px'