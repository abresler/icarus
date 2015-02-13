Template._viewAccounts.rendered = ->
  Session.set 'addingAccount', false

Template._viewAccounts.helpers
  allAccounts: ->
    Meteor.users.find()

  addingAccount: ->
    Session.get 'addingAccount'

Template._viewAccounts.events
  'click #add-account': (e,t) ->
    Session.set 'addingAccount', true

  'click #create-new-account': (e,t) ->

    first = t.find('#firstName').value
    last = t.find('#lastName').value
    username = t.find('#username').value
    email = t.find('#email').value
    telephone = t.find('#telephone').value

    Meteor.call 'createNewUser', first, last, username, email, telephone

    $('#firstName').val('')
    $('#lastName').val('')
    $('#username').val('')
    $('#email').val('')
    $('#telephone').val('')





    Session.set 'addingAccount', false
