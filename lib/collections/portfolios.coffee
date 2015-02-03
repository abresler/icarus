@Portfolios = new Mongo.Collection 'portfolios'

if Meteor.isServer
  Meteor.publish 'portfolios', -> # we will eventually want to publish based on owner
    Portfolios.find()

  Portfolios.allow
    insert: (userid, doc) -> # Eventually only admin access
      true

    update: (userId, docs, fields, modifier) ->
      true

    remove: (userId, docs) ->
      true

  Portfolios.deny
    insert: (userId, doc) ->

    update: (userId, docs, fields, modifier) ->

    remove: (userId, docs) ->


if Meteor.isClient
  Meteor.subscribe 'portfolios'

###
This collection will generally look like this:

_id:
debt:
  date:
  amount:
  event:
equity:
  date:
  amount:
  event:
realizedAsset:
  date:
  amount:
  event:
unrealizedAsset:
  date:
  amount:
  event:
owner:
property:

###