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
    Session.get "ownersList"
    console.log "button"
