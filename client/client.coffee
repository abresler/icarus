Accounts.ui.config
  passwordSignupFields: "USERNAME_AND_OPTIONAL_EMAIL"

Template.registerHelper "isAdmin", ->
    if Meteor.user()?.profile.roles.indexOf("admin") > -1 then true else false

Template.registerHelper "isInvestor", ->
  if Meteor.user()?.profile.roles.indexOf('client') > -1 then true else false

Template.registerHelper "formatMoney", (x) -> # takes in a number, converts it into money format
  x.formatMoney(0)

Template.registerHelper "formatMoney2", (x) -> # takes in number, returns with two decimal places
  x.formatMoney(2)
