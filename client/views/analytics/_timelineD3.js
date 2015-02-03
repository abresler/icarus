Template._timeline.rendered = function() {

  createTimeline = function() {
    var data = Portfolios.find().fetch()[2]; // change to find by id later
    var height = 350;
    var width = 1500;
    var margin = 100;
    var gridH = height - margin;
    var gridW = width - margin;
    
    var svg = d3.select("#_timeline").append("svg")
          .attr({
            height: height,
            width: width
          });

    var dateConverter = function(date) { return new Date(date); }
    var bisectDate = d3.bisector(function(d) { return d.date; }).left

    // DEBT DATE EXTENTS
    var debt = data.d;
    var equity = data.e;

    var debtDomain = [];
    var equityDomain = [];
    var domain = [];

    debt.forEach(function(d){domain.push({amount: d.amount, date: dateConverter(d.date)})});
    debt.forEach(function(d){debtDomain.push({amount: d.amount, date: dateConverter(d.date)})});
    equity.forEach(function(d){domain.push({amount: d.amount, date: dateConverter(d.date)})});
    equity.forEach(function(d){equityDomain.push({amount: d.amount, date: dateConverter(d.date)})});

    debtDomain.sort(function(a, b) {
      return a.date - b.date;
    })

    equityDomain.sort(function(a, b) {
      return a.date - b.date;
    })

    var dateScale = d3.time.scale().range([margin, width - margin]);
    dateScale.domain(d3.extent(domain, function(d) { return dateConverter(d.date) }));

    var valueScale = d3.scale.linear()
      .domain([d3.max(domain, function(d) { return d.amount }), d3.min(domain, function(d) { return d.amount })])
      .range([margin, height - margin]);

    var dateAxis = d3.svg.axis()
          .scale(dateScale)
          .ticks(10)
          .tickSize(10, 10)
          .tickFormat(d3.time.format("%b %y"))
          .orient("bottom"); // X axis

    var valueAxis = d3.svg.axis()
          .scale(valueScale)
          .ticks(6)
          .tickSize(10, 10)
          .orient("left") // Y axis

    svg.append("rect")
      .attr("class", "background")
      .attr("width", width)
      .attr("height", height)
      .attr("fill", "white")
      .on("mouseover", mouseover)
      .on("mouseout", mouseout)
      .on("mousemove", mousemove);

    svg.append("g")
      .attr("class", "axis")
      .attr("transform", "translate(" + margin + ",0)")
      .attr({
        stroke: "black"
      })
      .call(valueAxis);

    svg.append("g")
      .attr("class", "axis")
      .attr("transform", "translate(0," + (height - margin) + ")")
      .attr({
        stroke: "black"
      })
      .call(dateAxis);

    svg.append("g")
      .attr("class", "grid")
      .attr("transform", "translate(0," + gridH + ")")
      .call(dateAxis.tickSize(-gridH + margin, 0, 0).tickFormat(""));

    svg.append("g")
      .attr("class", "grid")
      .attr("transform", "translate(" + margin + ",0)")
      .call(valueAxis.tickSize(-gridW + margin, 0, 0).tickFormat(""));

    var line = d3.svg.line()
      .interpolate("cardinal")
      .x(function(d) { return dateScale(dateConverter(d.date) )})
      .y(function(d) { return valueScale(d.amount) })

    // DEBT DATA
    var debtGroup = svg.append("g")
      .attr("class", "debtGroup")

    var dPath = debtGroup.append("path")
      .attr("d", line(debt))
      .attr("stroke", "red")
      .attr("stroke-width", "1")
      .attr("fill", "none")

    var dPathLength = dPath.node().getTotalLength();

    dPath
      .attr("stroke-dasharray", dPathLength + " " + dPathLength)
      .attr("stroke-dashoffset", 0)

    // EQUITY DATA
    var equityGroup = svg.append("g")
      .attr("class", "equityGroup")

    var ePath = equityGroup.append("path")
      .attr("d", line(equity))
      .attr("stroke", "blue")
      .attr("stroke-width", "1")
      .attr("fill", "none")

    // INTERACTIVE GRAPH
    var debtFocus = svg.append("g")
      .attr("class", "debt")
      .style("display", "none")

    debtFocus.append("text")
      .attr("id", "debtFocus")
      .attr("fill", "red")
      .attr("dx", "15em")
      .attr("dy", "1.5em")

    var debtCircle = debtFocus.append("circle")
      .attr("id", "debtCircle")
      .attr("r", 4)
      .attr("fill", "red")

    var equityFocus = svg.append("g")
      .attr("class", "equity")
      .style("display", "none")

    equityFocus.append("text")
      .attr("id", "equity")
      .attr("fill", "blue")
      .attr("dx", "20em")
      .attr("dy", "1.5em")

    var equityCircle = equityFocus.append("circle")
      .attr("id", "equityCircle")
      .attr("r", 4)
      .attr("fill", "blue")

    var dateText = svg.append("g")
      .attr("class", "date")
      .style("display", "none")

    dateText.append("text")
      .attr("id", "date")
      .attr("fill", "black")
      .attr("dx", "8em")
      .attr("dy", "1.5em")


    var optionBox = svg.append("g")
      .attr("class", "options")

    var optionBorder = optionBox.append("rect")
      .attr("class", "options")
      .attr("width", width / 8)
      .attr("height", height / 10)
      .attr("transform", "translate(" + (width * 0.8) + " ," + (margin/8) +")")
      .attr("fill", "none")
      .attr("stroke", "black")

    optionBox.append("text")
      .attr("transform", "translate(" + (width * 0.81) + " ,0)")
      .attr("fill", "red")
      .attr("dy", "2.25em")
      .style("text-anchor", 'left')
      .text("Debt ROI")
      .on("click", debtClick);

    // TITLE
    svg.append("text")
      .attr("transform", "translate(" + (width / 2) + " ," + (margin - 25) + ")")
      .attr("fill", "black")
      .style("text-anchor", "middle")
      .text("Return on Debt & Equity");

    svg.append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 0 + margin - 50)
      .attr("x", 0 - (height / 2))
      .attr("fill", "#78B446")
      .style("text-anchor", "middle")
      .text("Y-axis");

    function mouseover() {
      debtCircle.style("display", null);
      debtFocus.style("display", null); 
      equityCircle.style("display", null);
      equityFocus.style("display", null);
      dateText.style("display", null);
    }

    function mouseout() {
      debtCircle.style("display", "none");
      debtFocus.style("display", "none");
      debtFocus.select("text").text("");
      equityCircle.style("display", "none");
      equityFocus.style("display", "none");
      equityFocus.select("text").text(""); 
      dateText.style("display", "none");
      dateText.select("text").text(""); 
    }

    function mousemove() {
      var bisect = d3.bisector(function(d) { return d.date }).left;
      var dateFormat = d3.time.format("%b %e, %Y")
      var x0 = dateScale.invert(d3.mouse(this)[0]);
      var i = bisect(debtDomain, x0);


      if(debtDomain[i-1]){
        debtFocus.select("text").text("Debt: " + debtDomain[i-1].amount);
        debtCircle.attr("transform", "translate(" + dateScale(debtDomain[i-1].date) + "," + valueScale(debtDomain[i-1].amount) + ')')
      }

      var j = bisect(equityDomain, x0);
      if(equityDomain[j-1]){
        equityCircle.attr("display", null)
        equityFocus.select("text").text("Equity: " + equityDomain[j-1].amount);
        equityCircle.attr("transform", "translate(" + dateScale(equityDomain[j-1].date) + "," + valueScale(equityDomain[j-1].amount) + ')')
      } else {
        equityCircle.attr("display", "none")
      }

      if(equityDomain[j-1] || debtDomain[i-1]){
        dateText.select("text").text(dateFormat(debtDomain[i-1].date));
      }
    }

    function debtClick() {
      dPath
      .attr("stroke-dasharray", dPathLength + " " + dPathLength)
      .attr("stroke-dashoffset", 0)
      .transition()
        .duration(2000)
        .ease("linear")
        .attr("stroke-dashoffset", dPathLength)
    }



  }
  createTimeline();
} 