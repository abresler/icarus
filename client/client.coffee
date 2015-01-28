Accounts.ui.config
  passwordSignupFields: "USERNAME_AND_OPTIONAL_EMAIL"

Template.registerHelper "isAdmin", ->
  if Meteor.user().profile.roles.indexOf "admin" > -1
    true
  else
    false
