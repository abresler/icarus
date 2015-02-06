Template._adminTermSheet.events
  # The context is the TermSheet, not the individual item, so we're going to have
  'click #purchasePrice': (e,t) ->
    Session.set 'editingPurchasePrice', true

  'click #closingRepair': (e,t) ->
    Session.set 'editingClosingRepair', true

  'click #rentPrice': (e,t) ->
    Session.set 'editingRentPrice', true

  'click #downPaymentPerc': (e,t) ->
    Session.set 'editingDownPaymentPerc', true

  'click #insurance': (e,t) ->
    Session.set 'editingInsurance', true

  'click #hoa': (e,t) ->
    Session.set 'editingHoa', true

  'click #apr': (e,t) ->
    Session.set 'editingApr', true

  'click #equityPerc': (e,t) ->
    Session.set 'editingEquityPerc', true




Template._adminTermSheet.helpers
  editingPurchasePrice: ->
    Session.get 'editingPurchasePrice'

  editingClosingRepair: ->
    Session.get 'editingClosingRepair'

  editingRentPrice: ->
    Session.get 'editingRentPrice'

  editingDownPaymentPerc: ->
    Session.get 'editingDownPaymentPerc'

  editingInsurance: ->
    Session.get 'editingInsurance'

  editingHoa: ->
    Session.get 'editingHoa'

  editingApr: ->
    Session.get 'editingApr'

  editingEquityPerc: ->
    Session.get 'editingEquityPerc'




Template._adminTermSheet.events
  'keypress #purchasePrice': (e,t) ->
    if e.keyCode is 13
      #update the termsheet with the propert value, remember "this" is the current termsheet
      Session.set 'editingPurchasePrice', false

  'keypress #closingRepair': (e,t) ->
    if e.keyCode is 13
      #update
      Session.set 'editingClosingRepair', false

  'keypress #rentPrice': (e,t) ->
    if e.keyCode is 13
      #update
      Session.set 'editingRentPrice', false

  'keypress #downPaymentPerc': (e,t) ->
    if e.keyCode is 13
      #update
      Session.set 'editingDownPaymentPerc', false

  'keypress #insurance': (e,t) ->
    if e.keyCode is 13
      #update
      Session.set 'editingInsurance', false

  'keypress #hoa': (e,t) ->
    if e.keyCode is 13
      #update
      Session.set 'editingHoa', false

  'keypress #apr': (e,t) ->
    if e.keyCode is 13
      #update
      Session.set 'editingApr', false

  'keypress #equityPerc': (e,t) ->
    if e.keyCode is 13
      #update
      Session.set 'editingEquityPerc', false
