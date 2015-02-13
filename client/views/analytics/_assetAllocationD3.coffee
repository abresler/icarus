Template._assetAllocation.rendered = ->
  Session.set 'activeTotal', 0
  Session.set 'activePercentage', 0

  sum = 0

  box = {s: 15}

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
    {
      type: "Prepaid" # Tax and Insurance
      total: 0
    }

  ]

  money = d3.format(',.2f')

  height = 400
  width = 400
  radius = Math.min(width, height)/2

  color = d3.scale.category10()

  arc = d3.svg.arc()
    .outerRadius(radius-10)
    .innerRadius(radius*0.4)

  transitionArc = d3.svg.arc()
    .outerRadius(radius)
    .innerRadius(radius*0.5)

  pie = d3.layout.pie()
    .value (d) -> d.total

  pieChart = d3.select "#analytics-asset-allocation"
    .append "svg"
    .attr "class", "pieChart"
    .attr "height", height
    .attr "width", width
    .append "g"
    .attr "class", "pieChart-location"
    .attr "transform", "translate(" + width/2 + "," + height/2 + ")"

  console.log data
  console.log pie data

  arcGroup = pieChart.selectAll "arc"
    .data pie(data)
    .enter()
    .append "g"
    .attr "class", "arc"

  arcGroup.append "path"
    .attr "d", arc
    .attr "class", "asset-path"
    .attr "class", "pie-slice"
    .attr "total", (d) -> d.data.total
    .style "fill", (d, i) -> color i

  arcGroup.append "text"
    .attr "transform", (d) -> "translate(" + arc.centroid(d) + ")"
    .attr "dy", "0.35em"
    .style "text-anchor", "middle"
    .style "fill", "white"
    .style "opacity", "0.9"
    .text (d) -> if d.data.total is 0 then "" else d.data.type

  element = d3.selectAll 'svg'
  element = element[0][0]

  bbox = element.getBBox()

  d3.selectAll 'path'
    .on 'click', (d) ->
      pieSliceToggle @ 
      populateSummary()
    .on 'mouseover', (d) -> 
      d3.select(@).style('opacity', 0.8)
    .on 'mouseout', (d) -> 
      d3.select(@).style('opacity', 1)

  legend= d3.select('#analytics-asset-allocation')
    .append 'svg'
    .attr 'class', 'pieChart-numbers'
    .attr 'height', height
    .attr 'width', width

  legendGroup = legend.selectAll 'arcData'
    .data data
    .enter()
    .append 'g'
    .attr 'class', 'asset-allocation-legend'

  legendGroup.append 'text'
    .attr 'class', 'asset-allocation-money'
    .attr 'x', width - 100
    .attr 'y', (d, i) -> (height/4) + i*30
    .style "text-anchor", "right"
    .style "fill", (d, i) -> color i
    .style "opacity", "0.9"
    .text (d) -> '$ ' + money d.total

  type = legendGroup.append 'text'
    .attr 'class', 'asset-allocation-type'
    .attr 'x', width/3
    .attr 'y', (d, i) -> (height/4) + i*30
    .style "text-anchor", "left"
    .style "fill", (d, i) -> color i
    .style "opacity", "0.9"
    .text (d) -> d.type

  legendGroup.append 'rect'
    .attr 'class', 'asset-allocation-rect'
    .attr 'x', width/4
    .attr 'y', (d, i) -> (height/4) + i*30 - 12.5
    .attr 'width', box.s
    .attr 'height', box.s
    .style "fill", (d, i) -> color i
    .style "opacity", "0.9"

  pieSliceToggle = (ele) ->
    thisPath = d3.select ele
    if thisPath.attr 'active' =='true'
      thisPath.transition().attr 'd', arc
      thisPath.attr 'active', false
    else
      thisPath.transition().attr 'd', transitionArc
      thisPath.attr 'active', true

  populateSummary = ->
    activeTotal = 0
    $('path[active="true"]').each (i, val) ->
      activeTotal += +$(val).attr('total')

    Session.set "activeTotal", activeTotal
    Session.set "activePercentage", +(activeTotal*100/sum).toFixed(2)

Template._assetAllocation.helpers
  percentage: -> 
    Session.get 'activePercentage'
  total: ->
    tempNum = Session.get 'activeTotal'
    tempNum.formatMoney(0)




