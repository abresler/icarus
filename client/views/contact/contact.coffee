Template.contact.rendered = ->
  Meteor.setTimeout ->
    $('.card-hide').addClass 'card-show'
    return
  , 250

Template.contact.events {}

Template.contact.helpers {}
