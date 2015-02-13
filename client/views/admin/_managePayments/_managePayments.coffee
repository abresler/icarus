Template._managePayments.rendered = ->

	bank = Bank.find().fetch()
	Session.set 'bank', bank[0].data.data

Template._managePayments.events
	'click .account-info': (e, t) ->
		target = $(e.currentTarget).toggleClass('account-selected')
		id = target.attr('id')
		$(".#{id}").toggleClass('transaction-hide')

Template._managePayments.helpers
	bank: ->
		Session.get 'bank'