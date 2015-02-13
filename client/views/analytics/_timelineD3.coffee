Template._timeline.rendered = ->

	owner = 'sam'

	height = d3.select('#_timeline').property('clientHeight') - 20
	width = d3.select('#_timeline').property('clientWidth')

	box = {s: 5}

	barShape = {width: 15}

	xAxisTransform = 20
	yAxisTransform = 60

	data = Portfolios.find({owner: owner}).fetch()

	debtLines = _.pluck(data, 'd')
	equityLines = _.pluck(data, 'e')

	dateAsc = (a, b) -> 
		dateA = new Date a.date
		dateB = new Date b.date
		return dateA - dateB


	allDebt = _.flatten debtLines
	sortDebt = Array.prototype.slice.call allDebt
	sortDebt = sortDebt.sort dateAsc

	allEquity = _.flatten equityLines
	sortEquity = Array.prototype.slice.call allEquity
	sortEquity = sortEquity.sort dateAsc


	allData = sortDebt.concat(sortEquity).sort dateAsc

	yDomain = d3.extent(allData, (d) -> d.amount)
	xDomain = d3.extent(allData, (d) -> new Date(d.date))

	xScale = d3.time.scale()
		.domain xDomain
		.range [yAxisTransform, width - yAxisTransform]
		
	yScale = d3.scale.linear()
		.domain [yDomain[1], yDomain[0]]
		.range [xAxisTransform, height - xAxisTransform]

	colorScale = d3.scale.category10()

	svg = d3.select '#_timeline'
		.append('svg')
		.attr 'class', 'equity-debt'
		.attr 
			height: height,
			width: width

	axis = svg.append 'g'
			.attr 'class', 'axis'

	xAxis = d3.svg.axis()
		.scale xScale
		.ticks(6)
		.orient 'bottom'

	yAxis = d3.svg.axis()
		.scale yScale
		.ticks(12)
		.tickFormat (d) -> (d3.formatPrefix(d).scale(d) + d3.formatPrefix(d).symbol)
		.orient 'left'

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

	bars = svg.append 'g'
		.attr 'class', 'debt'

	bars.selectAll 'rect'
		.data sortDebt
		.enter()
		.append('rect')
		.attr 'x', (d) -> xScale new Date d.date
		.attr 'y', yScale 0
		.attr 'width', barShape.width/2
		.attr 'height', (d, i) -> yScale d.amount
		.attr 'fill', 'steelblue'

	bars2 = svg.append 'g'
		.attr 'class', 'equity'

	bars2.selectAll 'rect'
		.data sortEquity
		.enter()
		.append('rect')
		.attr 'x', (d) -> (xScale new Date d.date) + barShape.width/2
		.attr 'y', yScale 0
		.attr 'width', barShape.width/2
		.attr 'height', (d, i) -> yScale d.amount
		.attr 'fill', '#D1122B'






















































	


	
