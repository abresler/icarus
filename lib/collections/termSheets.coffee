@TermSheets = new Mongo.Collection 'termSheets'

if Meteor.isServer
  Meteor.publish 'termSheets', ->
    TermSheets.find()

  TermSheets.allow
    insert: (userid, doc) -> # TODO This eventually needs to be admin only
      true

    update: (userId, docs, fields, modifier) -> # TODO This eventually needs to be admin only
      true

    remove: (userId, docs) -> # TODO This eventually needs to be admin only
      true

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
owner:



###
