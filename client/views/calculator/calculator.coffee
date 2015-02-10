Template.calculator.rendered = ->

	money = d3.format(',.2f')
	Session.setDefault "capRate", 0
	Session.setDefault "monthNet", money 0.00
	Session.setDefault "totInvest", money 0.00


Template.calculator.events
	'click #capbutton': (e, t) ->
		invest = t.find('#invest').value
		net = t.find('#income').value * 12
		Session.set 'capRate', +(net) / +(invest) * 100

	'click #invest-button': (e, t) ->
		cap = t.find('#cap').value
		net = t.find('#income').value * 12
		Session.set 'totInvest', +(net) / +(cap)

	'click #income-button': (e, t) ->
		cap = t.find('#cap').value
		invest = t.find('#invest').value
		Session.set 'monthNet', +(cap) * +(invest)

Template.calculator.helpers
	capRate: ->
		Session.get "capRate"

	monthNet: ->
		Session.get "monthNet"

	totInvest: ->
		Session.get "totInvest"

