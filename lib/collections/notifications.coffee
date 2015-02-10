@Notifications = new Mongo.Collection 'notifications'

if Meteor.isServer
  Meteor.publish 'notifications', -> # we will eventually want to publish based on owner
    Notifications.find()

  Notifications.allow
    insert: (userid, doc) -> # Eventually only admin access
      true

    update: (userId, docs, fields, modifier) ->
      true

    remove: (userId, docs) ->
      true

  Notifications.deny
    insert: (userId, doc) ->

    update: (userId, docs, fields, modifier) ->

    remove: (userId, docs) ->


if Meteor.isClient
  Meteor.subscribe 'notifications'