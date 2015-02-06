# SVG VARS
h = 550
w = 550
m = { top: 50, bottom: 100, right: 20, left: 20 }

xA = { x: 60, y: 350 }
yA = { x: 60, y: -100 }

Template._assetTimeline.rendered = ->
	Session.set "houses", []

	data = Session.get "house"

	createDefault = ->
		#SVG information
		svg = d3.select('#_assetTimeline').append('svg').attr({ height: h, width: w })
		
		defaultX = [new Date(2005, 0, 1), new Date(2015, 0, 1)]
		defaultY = [500e3, 0]

		xScale = d3.time.scale().domain(defaultX).range([xA.x, w-yA.x])
		yScale = d3.scale.linear().domain(defaultY).range([m.top, h-m.bottom])
	 
		xAxis = d3.svg.axis().scale(xScale).orient('bottom')

		yAxis = d3.svg.axis()
		.scale(yScale)
		.tickFormat (d) -> (d3.formatPrefix(d).scale(d) + d3.formatPrefix(d).symbol)
		.orient('left')

		axis = svg.append('g').attr('class', 'axis')

		aX = axis.append('g')
		.attr('class', 'x-axis')
		.attr('transform', 'translate(0,' + xA.y + ')')
		.attr({ stroke: 'black' })
		.call(xAxis)

		aY = axis.append('g')
		.attr('class', 'y-axis')
		.attr('transform', 'translate(' + yA.x + ',' + yA.y + ')')
		.attr({ stroke: 'black' })
		.call(yAxis)

	createDefault()

Template._assetTimeline.events
	'click #add-house': (e, t) ->
		zpid = t.find('#zpid').value

		Meteor.call 'getHistoric', zpid, (err, res) ->
			data = res.data[0].points
			svg = d3.select('#_assetTimeline svg')
			xAxis = svg.select('.axis .x-axis')
			yAxis = svg.select('.axis .y-axis')

			h = parseInt(d3.select("#_assetTimeline svg").attr("width"))
			w = parseInt(d3.select("#_assetTimeline svg").attr("height"))

			xScale = d3.time.scale()
				.domain d3.extent(data, (d) -> d.x)
				.range [xA.x, w-yA.x]

			yScale = d3.scale.linear()
				.domain [d3.max(data, (d) -> d.y), 0]
				.range([m.top, h-m.bottom])

			xAxis.call(xScale)
			yAxis.call(yScale)

			line = d3.svg.line()
			.interpolate 'linear'
			.x (d) -> xScale d.x
			.y (d) -> yScale d.y

			unreal = svg.append('g')
			.attr 'class', 'unreal'

			unPath = unreal.append('path')
			.attr 'd', line data
			.attr 'stroke', 'blue'
			.attr 'stroke-width', 1
			.attr 'stroke-dasharray', '5,5'
			.attr 'fill', 'none'
		return

Template._assetTimeline.helpers #for HTML template
	zpid: ->
		Session.get "house"



