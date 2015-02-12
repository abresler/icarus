@ProfileController = RouteController.extend(
  template: "profile"
  yieldTemplates: {}

  #YIELD_TEMPLATES
  onBeforeAction: ->

    #BEFORE_FUNCTION
    @next()
    return

  action: ->
    @render()
    return


  #ACTION_FUNCTION
  waitOn: ->
    [
      Meteor.subscribe "properties"
      Meteor.subscribe "termSheets"
      Meteor.subscribe "allUsers"
      Meteor.subscribe "portfolios"
    ]


  #WAIT_FUNCTION
  data: ->
    params: @params or {}


  #DATA_FUNCTION
  onAfterAction: ->
)
