Template.calculator.rendered = ->
	Session.setDefault "capRate", 0
	Session.setDefault "monthNet", 0
	Session.setDefault "totInvest", 0

Template.calculator.events
	'click #capbutton': (e, t) ->
		invest = t.find('#invest').value
		net = t.find('#income').value
		console.log(invest, net)
		Session.set 'capRate', parseInt(net) / parseInt(invest)

	'click #invest-button': (e, t) ->
		cap = t.find('#cap').value
		net = t.find('#income').value
		console.log(cap, net)
		Session.set 'totInvest', parseInt(net) / parseInt(cap)

	'click #income-button': (e, t) ->
		cap = t.find('#cap').value
		invest = t.find('#invest').value
		console.log(cap, invest)
		Session.set 'monthNet', parseInt(cap) * parseInt(invest)

Template.calculator.helpers
	capRate: -> #this is the variable you use to access in the template
		Session.get "capRate"

	monthNet: ->
		Session.get "monthNet"

	totInvest: ->
		Session.get "totInvest"

