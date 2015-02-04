Template._assetTimeline.rendered = function() {

  createAssetTimeline = function() {

    var height = 550;
    var width = 550;
    var margin = {top: 50, bottom: 100, right: 20, left: 20};
    var xAxis = {x: 60, y: 350 };
    var yAxis = {x: 60, y: -100 };
    var gridH = height - margin;
    var gridW = width - margin;
    
    var svg = d3.select("#_assetTimeline").append("svg")
          .attr({
            height: height,
            width: width
          });

    var bisectDate = d3.bisector(function(d) { return d.date; }).left

    Meteor.call('getHistoric', 39773106, function(err, res){
        historicData = res.data[0].points

        timeScale = d3.time.scale()
          .domain(d3.extent(historicData, function(d) { return new Date(d.x) }))
          .range([xAxis.x, width - yAxis.x])

        assetScale = d3.scale.linear()
          .domain([d3.max(historicData, function(d) { return d.y }), 0])
          .range([margin.top, height - margin.bottom]);

        timeAxis = d3.svg.axis()
          .scale(timeScale)
          .ticks(6)
          .tickSize(10, 10)
          .tickFormat(d3.time.format('%b %y'))
          .orient('bottom')

        assetAxis = d3.svg.axis()
          .scale(assetScale)
          .ticks(5)
          .tickSize(10, 10)
          .orient('left')

        svg.append('g')
          .attr('class', 'axis')
          .attr("transform", "translate(0," + xAxis.y + ")")
          .attr({
            stroke: 'black'
          })
          .call(timeAxis);

        svg.append('g')
          .attr('class', 'axis')
          .attr("transform", "translate(" + yAxis.x + "," + yAxis.y + ")")
          .attr({
            stroke: 'black'
          })
          .call(assetAxis); 

        line = d3.svg.line()
          .interpolate('linear')
          .x(function(d) { return timeScale(d.x) })
          .y(function(d) { return assetScale(d.y) })

        unrealized = svg.append("g")
          .attr("class", "unrealized")

        unPath = unrealized.append("path")
          .attr("d", line(historicData))
          .attr("stroke", "blue")
          .attr("stroke-width", "1")
          .attr("stroke-dasharray", "5, 5")
          .attr("fill", "none")





    })
    

  }

  createAssetTimeline();
} 