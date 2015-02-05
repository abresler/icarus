Template._assetTimeline.rendered = ->

	createAssetTimeline = ->
		h = 550
		w = 550
		m = 
			top: 50 
			bottom: 100 
			right: 20 
			left: 20
		xA =
			x: 60
			y: 350
		yA =
			x: 60
			y: -100
		gH = h - m.top
		gW = w - m.left

		svg = d3.select '#_assetTimeline' 
		.append 'svg'
		.attr 
			height: h 
			width: w

		bisectDate = d3.bisector (d) -> d.date 
		.left

		Meteor.call 'getHistoric', 39773106, (err, res) ->
			data = res.data[0].points
			console.log data

			timeScale = d3.time.scale()
			.domain d3.extent(data, (d) -> d.x)
			.range [xA.x, w - yA.x]

			assetScale = d3.scale.linear()
			.domain [d3.max(data, (d) -> d.y), 0]
			.range [m.top, h - m.bottom]

			timeAxis = d3.svg.axis()
			.scale timeScale
			.orient 'bottom'

			assetAxis = d3.svg.axis()
			.scale assetScale
			.orient 'left'

			svg.append 'g'
			.attr 'class', 'axis'
			.attr 'tranform', 'translate(0,' + xA.y + ')'
			.attr stroke: 'black'
			.call timeAxis

			svg.append 'g'
			.attr 'class', 'axis'
			.attr 'transform', 'translate(' + yA.x + ',' + yA.y + ')'
			.attr stroke: 'black'
			.call assetAxis

			line = d3.svg.line()
			.interpolate 'linear'
			.x (d) -> timeScale d.x
			.y (d) -> assetScale d.y

			unreal = svg.append('g')
			.attr 'class', 'unreal'

			urPath = unreal.append('path')
			.attr 'd', line(data)
			.attr 'stroke', 'blue'
			.attr 'stroke-width', 1
			.attr 'stroke-dasharray', '5,5'
			.attr 'fill', 'none'

		return

	createAssetTimeline()


