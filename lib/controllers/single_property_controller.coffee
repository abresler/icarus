@SinglePropertyController = RouteController.extend(
  template: "singleProperty"
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
    ]


  #WAIT_FUNCTION
  data: ->
    params: @params or {}


  #DATA_FUNCTION
  onAfterAction: ->
)
