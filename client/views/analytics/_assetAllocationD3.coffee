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

  Session.set 'pieData', data

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
    .attr "class", "waves-effect"
    .attr 'active', false
    .attr "total", (d) -> d.data.total
    .style "fill", (d, i) -> color i

  element = d3.selectAll 'svg'
  element = element[0][0]

  

  d3.selectAll 'path'
    .on 'click', (d, i) ->
      currentSelector = d3.select(@)
      currentStatus = currentSelector.attr 'active'
      textData = currentSelector.datum()
      console.log textData.data.type
      pieChart.select('.slice-type').text(textData.data.type.toUpperCase())
      pieChart.select('.slice-value').text('$ ' + money textData.value)
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
        .attr 'active', 'true'
    .on 'mouseover', (d, i) -> 
      d3.select(@).style 'opacity', 0.8
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

Template._assetAllocation.helpers
  pieData: ->
    Session.get 'pieData'



