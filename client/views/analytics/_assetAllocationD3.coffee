Template._assetAllocation.rendered = ->
  Session.set 'activeTotal', 0
  Session.set 'activePercentage', 0

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

  totals = _.pluck data, 'total'
  sum = totals.reduce (a, b) -> a+b

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

  element = d3.selectAll 'svg'
  element = element[0][0]

  bbox = element.getBBox()

  d3.selectAll 'path'
    .on 'mouseover', (d, i) -> 
      d3.select(@).style 'opacity', 0.8
      d3.selectAll '.asset-allocation-money'
        .each (d, j) ->
          if i is (j+1) then d3.select(@).style 'font-size', '20px'
      d3.selectAll '.asset-allocation-type'
        .each (d, j) ->
          if i is (j+1) then d3.select(@).style 'font-size', '20px'
      d3.selectAll '.asset-allocation-rect'
        .each (d, j) ->
          if i is (j+1)
            d3.select(@).attr 'width', box.s*1.2
            d3.select(@).attr 'height', box.s*1.2

    .on 'mouseout', (d, i) -> 
      d3.select(@).style('opacity', 1)
      d3.selectAll '.asset-allocation-money'
        .each (d, j) ->
          if i is (j+1) then d3.select(@).style 'font-size', '15px'
      d3.selectAll '.asset-allocation-type'
        .each (d, j) ->
          if i is (j+1) then d3.select(@).style 'font-size', '15px'
      d3.selectAll '.asset-allocation-rect'
        .each (d, j) ->
          if i is (j+1)
            d3.select(@).attr 'width', box.s
            d3.select(@).attr 'height', box.s

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
    .attr 'x', width - (width/8)
    .attr 'y', (d, i) -> (height/4) + i*30
    .style "text-anchor", "end"
    .style "fill", (d, i) -> color i
    .style "opacity", "0.9"
    .text (d) -> '$ ' + money d.total

  type = legendGroup.append 'text'
    .attr 'class', 'asset-allocation-type'
    .attr 'x', width/4
    .attr 'y', (d, i) -> (height/4) + i*30
    .style "text-anchor", "start"
    .style "fill", (d, i) -> color i
    .style "opacity", "0.9"
    .text (d) -> d.type

  legendGroup.append 'rect'
    .attr 'class', 'asset-allocation-rect'
    .attr 'x', width/6
    .attr 'y', (d, i) -> (height/4) + i*30 - 12.5
    .attr "rx", 3
    .attr "ry", 3
    .attr 'width', box.s
    .attr 'height', box.s
    .style "fill", (d, i) -> color i
    .style "opacity", "1"

  dataToggleGroup = legend.selectAll 'dataToggle'
    .data data
    .enter()
    .append 'g'
    .attr 'class', 'asset-allocation-legend'

  value = dataToggleGroup.append 'rect'
    .attr 'class', 'asset-allocation-button'
    .attr 'x', width/6
    .attr 'y', height/10
    .attr 'width', 50
    .attr 'height', 25
    .attr 'fill', '#D1122B'
    .on 'click', ->
      d3.selectAll '.asset-allocation-money'
        .each (d) -> 
          percent = Math.round(d.total/sum*100)
          d3.select(@).text(percent + '%')
    .on 'mouseover', (d) -> 
      d3.select(@).attr 'fill', "#ff9896"
    .on 'mouseout', (d) -> 
      d3.select(@).attr 'fill', '#D1122B'

  percent = dataToggleGroup.append 'rect'
    .attr 'class', 'asset-allocation-percent'
    .attr 'x', width/6 + 60
    .attr 'y', height/10
    .attr 'width', 50
    .attr 'height', 25
    .attr 'fill', '#D1122B'
    .on 'click', ->
      d3.selectAll '.asset-allocation-money'
        .each (d) -> 
          d3.select(@).text('$ '+ money d.total)
    .on 'mouseover', (d) -> 
      d3.select(@).attr 'fill', "#ff9896"
    .on 'mouseout', (d) -> 
      d3.select(@).attr 'fill', '#D1122B'

  dataToggleGroup.append 'text'
    .attr 'class', 'asset-allocation-percent'
    .attr 'x', width/6 + 25
    .attr 'y', height/10 + 20
    .style "text-anchor", "middle"
    .style "fill", "white"
    .style "opacity", "0.9"
    .text "%"

  dataToggleGroup.append 'text'
    .attr 'class', 'asset-allocation-value'
    .attr 'x', width/6 + 60 + 25
    .attr 'y', height/10 + 20
    .style "text-anchor", "middle"
    .style "fill", "white"
    .style "opacity", "0.9"
    .text "$"

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




