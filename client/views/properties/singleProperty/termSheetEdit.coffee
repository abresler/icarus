Template._adminTermSheet.events
  # The context is the TermSheet, not the individual item, so we're going to have
  'click #purchasePrice': (e,t) ->
    Session.set 'editingPurchasePrice', true

  'click #closingRepair': (e,t) ->

  'click #rentPrice': (e,t) ->

  'click #downPaymentPerc': (e,t) ->

  'click #insurance': (e,t) ->

  'click #hoa': (e,t) ->

  'click #apr': (e,t) ->

  'click #equityPerc': (e,t) ->


  'keypress #purchasePrice': (e,t) ->
    if e.keyCode is 13
      #update the termsheet with the propert value
      $('#purchasePrice').val('')
      Session.set 'editingPurchasePrice', false
      alert 'Successfully updated purchase price!'


Template._adminTermSheet.helpers
  editingPurchasePrice: ->
    Session.get 'editingPurchasePrice'
