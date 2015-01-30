Template.adminPanel.rendered = ->

Template.adminPanel.events {}

Template.adminPanel.helpers {}

Template._createAccount.events
  'click button': (e,t) ->
    e.preventDefault()

    first = t.find('#firstName').value
    last = t.find('#lastName').value
    username = t.find('#username').value
    email = t.find('#email').value
    telephone = t.find('#telephone').value

    Accounts.createUser
      username: username
      password: "password"
      profile:
        first: first
        last: last
        email: email
        telephone: telephone
        roles: ["client"]
    ,
      (err) ->
        if err
          alert err
        else
          alert "Success!"

    $('#firstName').val('')
    $('#lastName').val('')
    $('#username').val('')
    $('#email').val('')
    $('#telephone').val('')


    # toast("test", 3000)

Template._viewAccounts.helpers
  allAccounts: ->
    Meteor.users.find()

Template._addProperty.rendered = ->
  $('select').material_select()
  return

Template._addProperty.helpers
  allAccounts: ->
    Meteor.users.find()

Template._addProperty.events
  'change select': (e,t) ->
    t.find('select').value # gives value of user being added
    alert "Success"
    $('select').val('') # this is not properly clearing after selection has been made
