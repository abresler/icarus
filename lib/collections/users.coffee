if Meteor.isClient
  Meteor.subscribe 'allUsers'

if Meteor.isServer
  Meteor.publish 'allUsers', ->
    # if Meteor.user()?.profile.roles.indexOf 'admin' > -1 // Need to find a way to ensure access is admin only
    Meteor.users.find {},
      fields:
        profile: 1
        _id: 1
