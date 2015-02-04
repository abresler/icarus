Meteor.methods
  getProperty: (zpid) ->
    response = Meteor.http.call("GET", "http://www.zillow.com/webservice/GetZestimate.htm?zws-id=X1-ZWz1e01y8ugd8r_1brbp&zpid=#{zpid}")
    temp = undefined
    xml2js.parseString(response.content, (err, res) ->
      console.error "Error parsing string to json..." if err
      temp = res
    )
    temp

  getPropertyDetails: (zpid) ->
    response = Meteor.http.call("GET", "http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1e01y8ugd8r_1brbp&zpid=#{zpid}")
    temp = undefined
    xml2js.parseString(response.content, (err, res) ->
      console.error "Error parsing images string..." if err
      temp = res
    )
    temp

# need to replace zpid in the URL to accept a zpid as an argument;
  getHistoric: (zpid) ->
    res = Meteor.http.call("GET", "http://www.zillow.com/ajax/homedetail/HomeValueChartData.htm?mt=1&zpid=#{ zpid }&format=json")
    res
