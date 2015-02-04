Template.analytics.rendered = ->
  $('.modal-trigger').leanModal()

Template.analytics.events {}

Template._newProjects.helpers
  allPending: ->
    Properties.find
      status: "pending"
