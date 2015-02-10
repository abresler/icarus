Template._adminTermSheet.events
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

  'click #taxes': (e,t) ->
    Session.set 'editingTaxes', true




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

  editingTaxes: ->
    Session.get 'editingTaxes'



Template._adminTermSheet.events
  'keypress #purchasePrice': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          purchasePrice: +t.find('#purchasePrice').value
      Session.set 'editingPurchasePrice', false

  'keypress #closingRepair': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          closingRepair: +t.find('#closingRepair').value
      Session.set 'editingClosingRepair', false

  'keypress #rentPrice': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          rentPrice: +t.find('#rentPrice').value
      Session.set 'editingRentPrice', false

  'keypress #downPaymentPerc': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          downPaymentPerc: +t.find('#downPaymentPerc').value
      Session.set 'editingDownPaymentPerc', false

  'keypress #insurance': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          insurance: +t.find('#insurance').value
      Session.set 'editingInsurance', false

  'keypress #hoa': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          hoa: +t.find('#hoa').value
      Session.set 'editingHoa', false

  'keypress #apr': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          apr: +t.find('#apr').value
      Session.set 'editingApr', false

  'keypress #equityPerc': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          equityPerc: +t.find('#equityPerc').value
      Session.set 'editingEquityPerc', false

  'keypress #taxes': (e,t) ->
    if e.keyCode is 13
      TermSheets.update
        _id: @_id
      ,
        $set:
          taxes: +t.find('#taxes').value
      Session.set 'editingTaxes', false
