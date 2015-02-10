Template._addNewProject.rendered = ->


Template._addNewProject.events
  'click button': (e,t) ->
    e.preventDefault()
    if t.find('#zpid-project').value and t.find('#debt-needed').value and t.find('#equity-needed').value and t.find('#debt-roi').value and t.find('#equity-roi').value

      Meteor.call 'getProperty', +t.find('#zpid-project').value, (err,res) ->
        if err
          alert "Error with Zillow API call."

        else
          x = res["Zestimate:zestimate"]["response"]["0"]
          tempOwners = Session.get 'ownersList'
          owners = _.keys(tempOwners)

          Properties.insert
            # purchaseDate: formattedDate
            street: x["address"]["0"]["street"]["0"]
            city: x["address"]["0"]["city"]["0"]
            lat: x["address"]["0"]["latitude"]["0"]
            long: x["address"]["0"]["longitude"]["0"]
            state: x["address"]["0"]["state"]["0"]
            zip: x["address"]["0"]["zipcode"]["0"]
            zestimate: x["zestimate"]["0"]["amount"]["0"]["_"]
            zpid: x["zpid"]["0"]
            needed:
              debt: +t.find('#debt-needed').value
              equity: +t.find('#equity-needed').value
              debtROI: +t.find('#debt-roi').value
              equityROI: +t.find('#equity-roi').value
            # bed: bed
            # bath: bath
            # sqft: sqft
            # lotSizeSqft: lotSizeSqFt
            # rooms: rooms
            # yearBuilt: yearBuilt
            # imagesArray: imagesArray
            status: "pending"

          $('#zpid-project').val('')
          $('#debt-needed').val('')
          $('#equity-needed').val('')
          $('#debt-roi').val('')
          $('#equity-roi').val('')

          alert "Successfully added project!"

    else
      alert "Please enter the necessary data!"




Template._managePotentialProjects.helpers
  allPending: ->
    Properties.find(status: 'pending')





###

# # # This is all the broken stuff... Eventually we will have to fix this if we want to get property images from the Zillow API

Meteor.call('getProperty', +t.find('#zpid').value, (err, res) ->
  console.error "Error with Zillow API call..." if err
  console.log res
  # Now we want to add the new property to the database...

  x = res["Zestimate:zestimate"]["response"]["0"]
  address = x["address"]["0"]
  city = address["city"]["0"]
  latitude = address["latitude"]["0"]
  longitude = address["longitude"]["0"]
  state = address["state"]["0"]
  street = address["street"]["0"]
  zipcode = address["zipcode"]["0"]

  zestimate = x["zestimate"]["0"]["amount"]["0"]["_"]
  zpid = x["zpid"]["0"]

  # At this point in teh function, we've made the call to get the basic data from the http request.
  # next step is to get the property details from the second api call

  Meteor.call('getPropertyDetails', +t.find('#zpid').value, (err, res) ->
    console.error "Error with Zillow Details API call..." if err
    console.log res
    if res["UpdatedPropertyDetails:updatedPropertyDetails"]["message"]["0"]["code"]["0"] is "0" # This means that the code is "success"
      y = res["UpdatedPropertyDetails:updatedPropertyDetails"]["response"]["0"]["editedFacts"]["0"]
      bath = if y["bathrooms"]? then y["bathrooms"]["0"] else "unknown"
      bed = if y["bedrooms"]? then y["bedrooms"]["0"] else "unknown"
      sqft = if y["finishedSqft"]? then y["finishedSqft"]["0"] else "unknown"
      lotSizeSqft = if y["lotSizeSqFt"]? then y["lotSizeSqFt"]["0"] else "unknown"
      rooms = if y["rooms"]? then y["rooms"]["0"] else "unknown"
      yearBuilt = if y["yearBuilt"]? then y["yearBuilt"]["0"] else "unknown"
      imagesArray = if res["UpdatedPropertyDetails:updatedPropertyDetails"]["response"]["0"]["images"]? then res["UpdatedPropertyDetails:updatedPropertyDetails"]["response"]["0"]["images"]["0"]["image"]["0"]["url"] else []
    else
      console.error res["UpdatedPropertyDetails:updatedPropertyDetails"]["message"]["0"]["text"]["0"]

    Properties.insert
      bath: bath
      bed: bed
      city: city
      imagesArray: imagesArray
      lat: latitude
      long: longitude
      lotSizeSqft: lotSizeSqft
      needed:
        debt: t.find('#debt-needed').value
        equity: t.find('#equity-needed').value
        debtROI: t.find('#debt-roi').value
        equityROI: t.find('#equity-roi').value
      owners: [
      ]
      purchaseDate: ""
      rooms: rooms
      sqft: sqft
      state: state
      status: "pending"
      street: street
      termSheets: [

      ]
      yearBuilt: yearBuilt
      zestimate: zestimate
      zip: zipcode
      zpid: zpid

  )

)
###
