Template.adminProperty.rendered = ->

  latitude = @data.lat
  longitude = @data.long
  street = @data.street

  GoogleMaps.init
    sensor: true
    # 'key':
    language: 'en'
  , ->
    myLatLng = new google.maps.LatLng(latitude, longitude)
    mapOptions =
      zoom: 18
      mapTypeId: google.maps.MapTypeId.SATELLITE
      center: myLatLng

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)

    marker = new google.maps.Marker
      position: myLatLng
      map: map
      title: street



Template._adminPropertyCard.events
  'click #debt-needed': (e,t) ->
    Session.set("editingDebtRaise", true)

  'click #equity-needed': (e,t) ->
    Session.set("editingEquityRaise", true)

  'click #debt-roi': (e,t) ->
    Session.set("editingDebtROI", true)

  'click #equity-roi': (e,t) ->
    Session.set("editingEquityROI", true)


  'keypress #debt-needed-input': (e,t) ->
    if e.keyCode is 13
      Properties.update
        _id: @_id
      ,
        $set:
          "needed.debt": t.find('#debt-needed-input').value

      Session.set("editingDebtRaise", false)

  'keypress #equity-needed-input': (e,t) ->
    if e.keyCode is 13
      Properties.update
        _id: @_id
      ,
        $set:
          "needed.equity": t.find('#equity-needed-input').value

      Session.set("editingEquityRaise", false)

  'keypress #debt-roi-input': (e,t) ->
    if e.keyCode is 13
      Properties.update
        _id: @_id
      ,
        $set:
          "needed.debtROI": t.find('#debt-roi-input').value

      Session.set("editingDebtROI", false)

  'keypress #equity-roi-input': (e,t) ->
    if e.keyCode is 13
      Properties.update
        _id: @_id
      ,
        $set:
          "needed.equityROI": t.find('#equity-roi-input').value

      Session.set("editingEquityROI", false)


Template._adminPropertyCard.helpers
  editingDebtRaise: ->
    Session.get "editingDebtRaise"

  editingEquityRaise: ->
    Session.get "editingEquityRaise"

  editingDebtROI: ->
    Session.get "editingDebtROI"

  editingEquityROI: ->
    Session.get "editingEquityROI"
