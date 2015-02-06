Template._assetTimeline.rendered = ->

	temp = Properties.find
		# owners: Meteor.user()._id
		owners: 'bob' 
	.fetch()

	ids = _.pluck(temp, 'zpid')

	Meteor.call('getProperties', ids, (err, res) ->
		data = res
		domain = _.flatten domain.concat Array.prototype.slice.call _.values _.pick(house, 'points') for house in data
		

		plot(data)
	)
	
	createDefault()

Template._assetTimeline.events
	'click #add-house': (e, t) ->
		zpid = t.find('#zpid').value
		domain = callZ(zpid)
		drawLine()

Template._assetTimeline.helpers #for HTML template

# SVG VARS
h = 550
w = 550
m = { top: 50, bottom: 100, right: 20, left: 20 }

xA = { x: 60, y: 350 }
yA = { x: 60, y: -100 }

defaultX = [new Date(2005, 0, 1), new Date(2015, 0, 1)]
defaultY = [500e3, 0]

xScale = d3.time.scale().domain(defaultX).range([xA.x, w-yA.x])
yScale = d3.scale.linear().domain(defaultY).range([m.top, h-m.bottom])

createDefault = ->
	svg = d3.select('#_assetTimeline').append('svg').attr({ height: h, width: w })
	 
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

callZ = (zpid) ->
	data = {}

	Meteor.call 'getHistoric', zpid, (err, res) -> 
			h = Array.prototype.slice.call Session.get 'properties' 
			h.push(res.data[0])
			Session.set 'properties', h

			domain = []
			domain = _.flatten domain.concat Array.prototype.slice.call _.values _.pick(house, 'points') for house in h
			
			data = 
				xMax: d3.max(domain, (d) -> d.x)
				xMin: d3.min(domain, (d) -> d.x)
				yMax: d3.max(domain, (d) -> d.y)
				yMin: d3.min(domain, (d) -> d.y)

			Session.set 'd3', data

# drawLine = () ->
# 	data = Session.get 'd3'

# 	unreal = d3.select('#_assetTimeline svg').append('g')
# 	.attr 'class', 'unreal'

# 	line = d3.svg.line()
# 	.interpolate 'linear'
# 	.x (d) -> xScale d.x
# 	.y (d) -> yScale d.y

# 	unpath = unreal.selectAll('path').data(data)

# 	unpath.enter().append('path')
# 	.attr('d', line(data)
# 	.attr('class', 'line')






















	






