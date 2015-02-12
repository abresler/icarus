Template._adminPropertyCardDropdowns.rendered = ->
  Session.set "ownersList", {}

Template._adminPropertyCardDropdowns.helpers
  allAccounts: ->
    Meteor.users.find()

  ownersList: ->
    owners = Session.get "ownersList"
    console.log owners
    result = []
    _.keys(owners)?.forEach (key) ->
      tempObj =
        username: key
        _id: Meteor.users.findOne(username: key)._id
      result.push(tempObj)
    result

Template._adminPropertyCardDropdowns.events
  'change #change-status': (e,t) ->
    x = confirm "Are you sure you want to change the status of this property?"
    if x
      Properties.update
        _id: @_id
      ,
        $set:
          "status": t.find('#change-status').value
      Router.go 'adminPanel'
    $('#change-status').val('')

  'change #investor-change': (e,t) ->
    tempObject = Session.get 'ownersList'
    tempObject[t.find('select').value] = 0
    Session.set 'ownersList', tempObject
    $('select').val('')

  'click .fa-times': (e,t) ->
    owners = Session.get 'ownersList'
    console.log owners
    Session.set 'ownersList', _.omit(owners, @username)
