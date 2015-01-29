Template.singleProperty.rendered = ->

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

Template.singleProperty.helpers {}
