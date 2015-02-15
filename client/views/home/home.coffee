Template.home.rendered = ->
  createHomepageMap()
  Meteor.setTimeout ->
    $('.card-hide').addClass 'card-show'
    return
  , 250

Template._promo.rendered = ->
  Session.set 'investedCapital', 812422

Template._promo.events {}

Template._promo.helpers
  investedCapital: ->
    capital = +Session.get 'investedCapital'
    capital.formatMoney(0)

Meteor.setInterval ->
  Session.set 'investedCapital', Session.get('investedCapital') + Math.random() * 100
  return
, 2000
