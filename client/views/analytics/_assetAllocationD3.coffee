data = [
    {
      type: "Loan"
      total: 40000
    }
    { 
      type: "Equity"
      total: 13000
    }
    {
      type: "Deferred" #Leasing Cost
      total: 3000
    }
]

totals = _.pluck data, 'total'
sum = totals.reduce (a, b) -> a+b  
addPercent = []

data.forEach (d, i) ->
  percent = {
    type: d.type
    total: d.total
    percent: Math.round(d.total/sum*100)
  }
  addPercent.push(percent)
  
money = d3.format(',.0f')

height = 250
width = 250
radius = Math.min(width, height)/2

color = d3.scale.category10()

arc = d3.svg.arc()
  .outerRadius(radius-10)
  .innerRadius(radius*0.4)

transitionArc = d3.svg.arc()
  .outerRadius(radius)
  .innerRadius(radius*0.5)

Template._assetAllocation.rendered = ->
  colorCoordination()
  Session.set 'pieData', addPercent
  Session.setDefault 'isValue', true
  Session.setDefault 'isPercent', false

  pie = d3.layout.pie()
    .value (d) -> d.total

  pieChart = d3.select "#analytics-asset-allocation"
    .append "svg"
    .attr "class", "pie-chart"
    .attr "height", height
    .attr "width", width
    .append "g"
    .attr "class", "pie-chart-location"
    .attr "transform", "translate(" + width/2 + "," + height/2 + ")"

  arcGroup = pieChart.selectAll "arc"
    .data pie(data)
    .enter()
    .append "g"
    .attr "class", "arc"

  arcGroup.append "path"
    .attr "d", arc
    .attr "class", "asset-path"
    .attr "class", "pie-slice"
    .attr "class", "waves-effect"
    .attr 'active', false
    .attr "total", (d) -> d.data.total
    .style "fill", (d, i) -> color i

  d3.selectAll 'path'
    .on 'click', pieToggle
    .on 'mouseover', (d, i) -> 
      d3.select(@).style 'opacity', 0.7
    .on 'mouseout', (d, i) -> 
      d3.select(@).style('opacity', 1)

  arcGroup.append 'text'
    .attr 'class', 'slice-type'
    .attr 'x', 0
    .attr 'y', 0  
    .attr 'text-anchor', 'middle'
    .attr 'font-family', 'Roboto, sans-serif'
    .attr 'fill', '#D1122B'

  arcGroup.append 'text'
    .attr 'class', 'slice-value'
    .attr 'x', 0
    .attr 'y', 20
    .attr 'text-anchor', 'middle'
    .attr 'font-family', 'Roboto, sans-serif'
    .attr 'font-size', '20px'
    .attr 'fill', '#D1122B'

Template._assetAllocation.events
  'click #pie-percent': (e, t) ->
    Session.set 'isPercent', true
    Session.set 'isValue', false

  'click #pie-value': (e, t) ->
    Session.set 'isPercent', false
    Session.set 'isValue', true

  'click .pie-type-DE': (e, t) ->
    assetType = d3.select(@)['0']['0'].type
    d3.select('.pie-chart').selectAll('path').each (d, i) ->
      slice = d3.select(@)
      sliceType = slice.datum().data.type
      if assetType is sliceType
        pieToggle.call(@)

Template._assetAllocation.helpers
  pieData: ->
    Session.get 'pieData'

  toggleValue: ->
    Session.get 'isValue'

  togglePercent: ->
    Session.get 'isPercent'

pieToggle = ->
  currentSelector = d3.select(@)
  currentStatus = currentSelector.attr 'active'
  textData = currentSelector.datum()
  pieChart = d3.select('.pie-chart')
  arcGroup = d3.select('.pie-chart-location') 
  pieChart.select('.slice-type').text(textData.data.type.toUpperCase())
  pieChart.select('.slice-value').text ->
    if Session.get 'isValue'
      return Math.round(textData.value/sum*100) + '%'
    if Session.get 'isPercent'
      return '$ ' + money textData.value
  if currentStatus is 'false'
    arcGroup.selectAll('path').each (d) ->
      selector = d3.select(@)
      status = selector.attr 'active'
      if status is 'true'
        selector.transition().attr 'd', arc
        .duration 1000
          .ease 'linear'
          .attr 'active', 'false'
    currentSelector.transition().attr 'd', transitionArc
    .duration 1000
    .ease 'linear'
    .attr 'active', 'true'
  else
    pieChart.select('.slice-type').text ''
    pieChart.select('.slice-value').text ''
    currentSelector.transition().attr 'd', arc
    .duration 1000
    .ease 'linear'
    .attr 'active', 'false'

colorCoordination = ->
  d3.selectAll('#pie-square').each (d, i) ->
    d3.select(@).style 'color', color i



