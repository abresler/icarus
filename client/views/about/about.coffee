Template.about.rendered = ->
  $('.collapsible').collapsible()

  Meteor.setTimeout ->
    $('.card1').addClass 'card-show'
    return
  , 250

  Meteor.setTimeout ->
    $('.card2').addClass 'card-show'
    return
  , 500

  Meteor.setTimeout ->
    $('.card3').addClass 'card-show'
    return
  , 750

  Meteor.setTimeout ->
    $('.card4').addClass 'card-show'
    return
  , 1000

Template.about.events {}

Template.about.helpers {}
