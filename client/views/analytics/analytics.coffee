Template.analytics.rendered = ->
  createAssetAllocation()
  $('.modal-trigger').leanModal()
  # Meteor.setTimeout ->
  #   $('.arc').trigger('click')
  #   return
  # , 500

Template.analytics.events {}





Template._newProjects.helpers
  allPending: ->
    Properties.find
      status: "pending"
