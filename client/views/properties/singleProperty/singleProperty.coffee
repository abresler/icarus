Template.singleProperty.rendered = ->
  # console.log @data

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

Template.singleProperty.events {}

Template.singleProperty.helpers
  currentProperty: ->
    # console.log @data
    # @data._id


Template._clientTermSheet.helpers
  owner: ->
    # console.log TermSheets.find('property._id': Template.currentData()._id, ).fetch()
    TermSheets.find
      'property._id': Template.currentData()._id
      'owner._id': Meteor.user()._id

Template._adminTermSheet.rendered = ->
  $('ul.tabs').tabs()

Template._adminTermSheet.helpers
  # allAccounts: ->
  #   Meteor.users.find()

  owners: ->
    # console.log TermSheets.find('property._id': Template.currentData()._id).fetch()
    TermSheets.find
      'property._id': Template.currentData()._id
    # first I need to find the relevant termsheet
    # then I need to get the owners array
    # for each owner, give them a new tab and display their data






  allTermSheets: ->
    # TermSheets.find
    #   property: @
    #   # owner:
