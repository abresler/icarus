Future = Npm.require("fibers/future")

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
  getProperties: (zpids) ->
    console.log zpids

    futures = _.map zpids, (id, index) ->
      future = new Future();  
      Meteor.http.call "GET", "http://www.zillow.com/ajax/homedetail/HomeValueChartData.htm?mt=1&zpid=#{ id }&format=json", (err, data) ->
        future.return(data)
        console.log(data)      
      future

    results = _.map futures, (future, index) ->
      result = future.wait()

    results



