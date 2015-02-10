@Bank = new Mongo.Collection 'bank'

if Meteor.isServer
  Meteor.publish 'bank', -> # we will eventually want to publish based on owner
    Bank.find()

  Bank.allow
    insert: (userid, doc) -> # Eventually only admin access
      true

    update: (userId, docs, fields, modifier) ->
      true

    remove: (userId, docs) ->
      true

if Meteor.isClient
  Meteor.subscribe 'bank'