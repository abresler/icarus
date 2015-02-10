Template._newInvestorNotification.rendered = ->
	allClients = []

	Meteor.users.find().fetch().forEach (user) ->
		if user.profile.roles[0] == 'client' then allClients.push(user)

	Session.set 'clients', allClients
	Session.set 'selected', []

Template._newInvestorNotification.events

	'change #investor-notification-selection': (e,t) ->
		allClients = Session.get 'clients'
		currentSelect = Session.get 'selected'
		selection = _.findWhere(allClients, {username: $(e.target).val()})
		currentSelect.push(selection)
		Session.set 'selected', currentSelect
		$('#investor-notification-selection').prop('selectedIndex', 0)

	'click #remove-investor': (e,t) ->
		currentSelect = Session.get 'selected'
		remove = $(e.currentTarget).children('span').text().trim()
		selection = _.findWhere(currentSelect, {username: remove})
		index = currentSelect.indexOf(selection)
		currentSelect.splice(index, 1)
		Session.set 'selected', currentSelect

	'click #submit-investor-notification': (e,t) ->
		message = $('#investor-notification').val()
		currentSelect = Session.get 'selected'

		if currentSelect.length == 0
			alert 'No recipient for this message!'
		else if message.length < 10
			alert 'Message too short'
		else
			Notifications.insert
				investors: currentSelect
				message: message
				sent: Date.now()
				type: 'investor'
			alert 'Message sent successfully!'
			$('#investor-notification').val('')


Template._newInvestorNotification.helpers
	allInvestors: ->
		Session.get 'clients'

	investors: ->
		Session.get 'selected'