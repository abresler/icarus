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
    if +t.find('#zpid').value # Error handles for no ZPID and a bad ZPID
      if Object.keys(Session.get('ownersList')).length > 0 # Error handles for a property with no owners

        Meteor.call 'getProperty', +t.find('#zpid').value, (err,res) ->
          console.error "Error with Zillow API call." if err

          console.log res

          x = res["Zestimate:zestimate"]["response"]["0"]
          tempOwners = Session.get 'ownersList'
          owners = _.keys(tempOwners)

          Properties.insert
            # purchaseDate: formattedDate
            owners: owners
            street: x["address"]["0"]["street"]["0"]
            city: x["address"]["0"]["city"]["0"]
            lat: x["address"]["0"]["latitude"]["0"]
            long: x["address"]["0"]["longitude"]["0"]
            state: x["address"]["0"]["state"]["0"]
            zip: x["address"]["0"]["zipcode"]["0"]
            zestimate: x["zestimate"]["0"]["amount"]["0"]["_"]
            zpid: x["zpid"]["0"]
            # bed: bed
            # bath: bath
            # sqft: sqft
            # lotSizeSqft: lotSizeSqFt
            # rooms: rooms
            # yearBuilt: yearBuilt
            # imagesArray: imagesArray
            status: "complete"

          # Meteor.call 'getPropertyImages', +t.find('#zpid').value, (err,res2) ->
          #   console.error "Error with Zillow Details API call." if err
          #   if res2["UpdatedPropertyDetails:updatedPropertyDetails"]["message"]["0"]["code"]["0"] is "0" # this is the message code for "success"
          #
          #     y = res2["UpdatedPropertyDetails:updatedPropertyDetails"]["response"]["0"]["editedFacts"]["0"]
          #
          #   else console.log res2["UpdatedPropertyDetails:updatedPropertyDetails"]["message"]["0"]["text"]["0"] # this is the message if details api was not successful
          #



        # Session.set 'ownersList', {} # We should reset this after we've added to the database

      else alert "Must add at least one owner."
    else alert "Please enter a valid ZPID."
    $('select').val('')
    $('input').val('')
