@AnalyticsController = RouteController.extend(
  template: "analytics"
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
      Meteor.subscribe "portfolios"
      Meteor.subscribe 'properties'
    ]


  #WAIT_FUNCTION
  data: ->
    params: @params or {}


  #DATA_FUNCTION
  onAfterAction: ->
)
