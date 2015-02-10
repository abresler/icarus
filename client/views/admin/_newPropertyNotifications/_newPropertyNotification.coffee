Template._newPropertyNotification.rendered = ->
	allProperties = Array.prototype.slice.call Properties.find().fetch()

	Session.set 'properties', allProperties
	Session.set 'propertiesSelected', []

Template._newPropertyNotification.events

	'change #property-notification-selection': (e,t) ->
		allProperties = Session.get 'properties'
		currentSelect = Session.get 'propertiesSelected'
		selection = _.findWhere(allProperties, {_id: $(e.target).val()})
		currentSelect.push(selection)
		Session.set 'propertiesSelected', currentSelect
		$('#property-notification-selection').prop('selectedIndex', 0)

	'click #remove-property': (e,t) ->
		currentSelect = Session.get 'propertiesSelected'
		remove = $(e.currentTarget).children('span').attr('id')
		selection = _.findWhere(currentSelect, {_id: remove})
		index = currentSelect.indexOf(selection)
		currentSelect.splice(index, 1)
		Session.set 'propertiesSelected', currentSelect

	# 'click #submit-property-notification': (e,t) ->
	# 	message = $('#property-notification').val()
	# 	currentSelect = Session.get 'propertiesSelected'



		# if currentSelect.length == 0
		# 	alert 'No recipient for this message!'
		# else if message.length < 10
		# 	alert 'Message too short'
		# else
		# 	Notifications.insert
		# 		investors: currentSelect
		# 		message: message
		# 		sent: Date.now()
		# 		type: 'property'
		# 	alert 'Message sent successfully!'
		# 	$('#property-notification').val('')

Template._newPropertyNotification.helpers
	allProperties: ->
		Session.get 'properties'

	properties: ->
		Session.get 'propertiesSelected'