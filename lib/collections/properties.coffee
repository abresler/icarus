@Properties = new Mongo.Collection 'properties'

if Meteor.isServer
  Meteor.publish 'properties', ->
    Properties.find()
    # Properties.find owners: $elemMatch: _id: @userId

  Properties.allow
    insert: (userid, doc) ->

      # return (userid && doc.owner === userid);
      true

    update: (userId, docs, fields, modifier) ->

      # return _.all(docs, function(doc) {
      #   return doc.owner === userId;
      # })
      true

    remove: (userId, docs) ->

      # return _.all(docs, function(doc) {
      #   return doc.owner === userId;
      # })
      true

  Properties.deny
    insert: (userId, doc) ->

    update: (userId, docs, fields, modifier) ->

    remove: (userId, docs) ->


if Meteor.isClient
  Meteor.subscribe 'properties'
