Template._addProperty.rendered = ->
  $('select').material_select()
  Session.set "ownersList", {}
  Session.set 'addingProperty', false
  return

Template._addProperty.helpers
  addingProperty: ->
    Session.get 'addingProperty'

  allAccounts: ->
    Meteor.users.find()

  allCompleted: ->
    Properties.find
      status: "complete"

  ownersList: ->
    owners = Session.get "ownersList" # TODO now that we've changed it, we have a context issue
    result = []
    _.keys(owners)?.forEach (key) ->
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
    "$" + TermSheets.findOne( "property._id": propId )?.purchasePrice.formatMoney(0)


Template._addProperty.events
  'click #add-property': (e,t) ->
    Session.set 'addingProperty', true

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
              status: "complete"

            Properties.insert insertProperty
            Session.set 'ownersList', {}
            toast("Successfully added property!", 4000)

      else alert "Must add at least one owner."
    else alert "Please enter a valid ZPID."
    $('select').val('')
    $('input').val('')
    Session.set 'addingProperty', false
