Future = Npm.require("fibers/future")

Meteor.methods
  getProperty: (zpid) ->
    response = Meteor.http.call("GET", "http://www.zillow.com/webservice/GetZestimate.htm?zws-id=X1-ZWz1e01y8ugd8r_1brbp&zpid=#{zpid}")
    temp = undefined
    xml2js.parseString(response.content, (err, res) ->
      console.error "Error parsing string to json..." if err
      temp = res
    )
    console.log temp
    temp

  getPropertyDetails: (zpid) ->
    response = Meteor.http.call("GET", "http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1e01y8ugd8r_1brbp&zpid=#{zpid}")
    temp = undefined
    xml2js.parseString(response.content, (err, res) ->
      console.error "Error parsing images string..." if err
      temp = res
    )
    console.log temp
    temp

# need to replace zpid in the URL to accept a zpid as an argument;
  getProperties: (zpid) ->
    property = new Future()
    history = new Future()  

    Meteor.http.call "GET", "http://www.zillow.com/webservice/GetZestimate.htm?zws-id=X1-ZWz1e01y8ugd8r_1brbp&zpid=#{ zpid }", (err, data) ->
      xml2js.parseString data.content, (err, res) ->
        address = res["Zestimate:zestimate"]["response"]["0"]["address"]
        zestimate = res["Zestimate:zestimate"]["response"]["0"]["zestimate"]
        id = res["Zestimate:zestimate"]["response"]["0"]["zpid"]
        homeArray = [address, zestimate, id]
        property.return(homeArray)

    Meteor.http.call "GET", "http://www.zillow.com/ajax/homedetail/HomeValueChartData.htm?mt=1&zpid=#{ zpid }&format=json", (err, data) ->
      dataHistory = data["data"]["0"]["points"]
      history.return(dataHistory)

    results = [property.wait(), history.wait()]

    results


    
