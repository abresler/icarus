Template._managePayments.rendered = ->
	$('.datepicker').pickadate({
		format: 'mmm dd yyyy'
	})
	Session.setDefault 'add', 'none'

	paymentHistory = [
		{
			date: '15 January 2015'
			category: 'loan'
			memo: 'new garage'
			amount: 50000
		}
		{
			date: '17 January 2015'
			category: 'rent'
			memo: '17 Stone St'
			amount: 4500
		}
		{
			date: '29 January 2015'
			category: 'investor payment'
			memo: '114 Hamilton Ave'
			amount: 25000
		}
		{
			date: '1 February 2015'
			category: 'contractor payment'
			memo: '50 Ramapo Plaza'
			amount: 9500
		}
	]

	amounts = _.pluck paymentHistory, 'amount'
	total = d3.sum amounts

	Session.set 'total', total
	Session.set 'paymentHistory', paymentHistory
# 	bank = Bank.find().fetch()
# 	Session.set 'bank', bank[0].data.data

Template._managePayments.events
# 	'click .account-info': (e,t) ->
# 		target = $(e.currentTarget).toggleClass('account-selected')
# 		id = target.attr('id')
# 		$(".#{id}").toggleClass('transaction-hide')
	'click #add-payment': (e, t) ->
		Session.set 'add', 'null'

	'click #cancel-payment': (e, t) ->
		Session.set 'add', 'none'

	'click #submit-payment': (e, t) ->
		date = t.find('#payment-date').value
		if date.length is 0 then return toast('Need a Date!', 3000) 
		category = t.find('#payment-category').value
		if category.length < 2 then return toast('Need a Category!', 3000) 
		memo = t.find('#payment-memo').value
		if memo.length < 2 then return toast('Add a little memo!', 3000) 
		amount = +t.find('#payment-amount').value
		if amount is 0 then return toast('Need transaction amount!', 3000) 
		newPayment = {
			date: date
			category: category
			memo: memo
			amount: amount
		}
		t.find('#payment-date').value = ''
		t.find('#payment-category').value = ''
		t.find('#payment-memo').value = ''
		t.find('#payment-amount').value = ''
		history = Session.get 'paymentHistory'
		history.push newPayment
		sortedHistory = history.sort(sortByDateAscending)
		console.log sortedHistory
		amounts = _.pluck history, 'amount'
		total = d3.sum (amounts)
		Session.set 'add', 'none'
		Session.set 'paymentHistory', sortedHistory
		Session.set 'total', total
		toast('Successfully added new transaction!')

Template._managePayments.helpers 
# 	bank: ->
# 		Session.get 'bank'
# 	}
	add: ->
		Session.get 'add'

	history: ->
		Session.get 'paymentHistory'

	total: ->
		Session.get 'total'

sortByDateAscending = (a, b) ->
	adate = new Date(a.date)
	bdate = new Date(b.date)
	return adate - bdate














	