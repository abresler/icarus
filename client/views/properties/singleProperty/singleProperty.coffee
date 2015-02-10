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

Template._termSheet.rendered = ->
  # If there is no termsheet, we will give one to icarus with no values, but 100% ownership
  if TermSheets.find( "property._id": @data._id).count() is 0

    ownerIdArray = @data.owners
    property = @data

    ownerIdArray.forEach (ownerId) ->
      owner = Meteor.users.findOne(ownerId)

      TermSheets.insert
        apr: 0
        capitalPercNeeded: 0
        downPaymentPerc: 0
        equityPerc: 100
        hoa: 0
        insurance: 0
        owner: owner
        property: property
        purchasePrice: 0
        rentPrice: 0
        taxes: 0

Template._clientTermSheet.helpers
  owner: ->
    TermSheets.find
      'property._id': Template.currentData()._id
      'owner._id': Meteor.user()._id


Template._adminTermSheet.rendered = ->
  Meteor.setTimeout -> # TODO this is the lazy way to take care of new termsheet creation, which causes hte tabs to be created after the template has been rendered, and thus, initialized. ideally, this would use an autorun
    $('ul.tabs').tabs()
  , 250

Template._adminTermSheet.helpers
  owners: ->
    TermSheets.find
      'property._id': Template.currentData()._id
