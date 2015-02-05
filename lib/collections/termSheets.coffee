@TermSheets = new Mongo.Collection 'termSheets'

if Meteor.isServer
  Meteor.publish 'termSheets', ->
    TermSheets.find()

  TermSheets.allow
    insert: (userid, doc) ->
      true

    update: (userId, docs, fields, modifier) ->
      true

    remove: (userId, docs) ->
      true

  TermSheets.deny
    insert: (userId, doc) ->

    update: (userId, docs, fields, modifier) ->

    remove: (userId, docs) ->


if Meteor.isClient
  Meteor.subscribe 'termSheets'

###
Inputs for the term sheet include:

purchasePrice
downPaymentPerc
closingRepair
apr
taxes
hoa
insurance
rentPrice

equityPerc:
capitalNeeded:

property:
owners:



###
