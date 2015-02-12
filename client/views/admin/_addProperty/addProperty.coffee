Template._addProperty.rendered = ->
  $('select').material_select()
  Session.set "ownersList", {}
  return

Template._addProperty.helpers
  allAccounts: ->
    Meteor.users.find()

  allCompleted: ->
    Properties.find
      status: "complete"

  ownersList: ->
    owners = Session.get "ownersList"
    result = []
    _.keys(owners).forEach (key) ->
      tempObj =
        username: Meteor.users.findOne(_id: key).username
        _id: key
      result.push(tempObj)
    result

  propertyOwners: (arr) ->
    temp = []
    arr.forEach (ownerId) ->
      temp.push(Meteor.users.findOne(ownerId).username) # TODO There is an error here when it can't find the username... only a problem for development. No future users will not have a username
    temp.join(", ")

  purchasePrice: (propId) ->
    "$" + TermSheets.findOne( "property._id": propId ).purchasePrice.formatMoney(0)


Template._addProperty.events
  'change select': (e,t) ->
    tempObject = Session.get 'ownersList'
    tempObject[t.find('select').value] = 0
    Session.set 'ownersList', tempObject
    $('select').val('')

  'click .fa-times': (e,t) ->
    owners = Session.get 'ownersList'
    Session.set 'ownersList', _.omit(owners, @_id)

  'click button': (e,t) ->
    e.preventDefault()

    zpid = +t.find('#zpid').value

    if zpid # Error handles for no ZPID and a bad ZPID
      if Object.keys(Session.get('ownersList')).length > 0 # Error handles for a property with no owners

        Meteor.call 'getProperties', zpid, (err,res) ->
          console.log res
          if err then alert "Error with Zillow API call."
          else
            tempOwners = Session.get 'ownersList'
            owners = _.keys(tempOwners)
            address = res["0"]["0"]["0"]
            zData = res["0"]["1"]["0"]
            id = res["0"]["2"]["0"]
            history = res["1"]

            insertProperty =
              owners: owners
              city: address["city"]["0"]
              street: address["street"]["0"]
              lat: address["latitude"]["0"]
              long: address["longitude"]["0"]
              state: address["state"]["0"]
              zip: address["zipcode"]["0"]
              zestimate: zData["amount"]["0"]["_"]
              zpid: id
              history: history
                  # bed: bed
                  # bath: bath
                  # sqft: sqft
                  # lotSizeSqft: lotSizeSqFt
                  # rooms: rooms
                  # yearBuilt: yearBuilt
                  # imagesArray: imagesArray
              status: "complete"

            Properties.insert insertProperty
            Session.set 'ownersList', {}
            alert "Successfully added property!"

          #   Session.set 'ownersList', {}

          #   alert "Successfully added property!"

          #   # Meteor.call 'getPropertyImages', +t.find('#zpid').value, (err,res2) ->
          # #   console.error "Error with Zillow Details API call." if err
          # #   if res2["UpdatedPropertyDetails:updatedPropertyDetails"]["message"]["0"]["code"]["0"] is "0" # this is the message code for "success"
          # #
          # #     y = res2["UpdatedPropertyDetails:updatedPropertyDetails"]["response"]["0"]["editedFacts"]["0"]
          # #
          # #   else console.log res2["UpdatedPropertyDetails:updatedPropertyDetails"]["message"]["0"]["text"]["0"] # this is the message if details api was not successful
          # #

      else alert "Must add at least one owner."
    else alert "Please enter a valid ZPID."
    $('select').val('')
    $('input').val('')
