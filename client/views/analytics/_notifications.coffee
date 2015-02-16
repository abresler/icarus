Template._notifications.rendered = ->
	rowHeight = d3.select('#analytics-allocation').property('clientHeight')
	d3.select('#analytics-notifications').style('height', rowHeight+'px')
	Session.setDefault 'notes', []
	userID = Meteor.user()._id
	userNotes = []
	allNotes = Notifications.find().fetch()

	allNotes.forEach (d, i) ->
		if _.contains(d.investors, userID) then userNotes.push(d)

	Session.set 'notes', userNotes
	Session.set 'noteChecked', []

Template._notifications.events
	'click .checkbox-field': (e, t) ->
		noteId = d3.select(this).node()._id
		checked = Session.get 'noteChecked'
		checked.push(noteId)
		Session.set 'noteChecked', checked

	'click #archive-notification': (e, t) ->
		checked = Session.get 'noteChecked'
		userNotes = Session.get 'notes'
		selected = []

		checked.forEach (c, i) ->
			temp = _.findWhere(userNotes, {_id: c})
			selected.push temp

		checked.forEach (c, i) ->
			temp = _.reject(userNotes, (d) ->
				d._id is c
			)
			userNotes = temp
		Session.set 'notes', userNotes #SET AS CURRENTLY ACTIVE NOTIFICATIONS
		Session.set 'noteChecked', selected #SEND TO ARCHIVE

	'click #delete-notification': (e, t) ->
		checked = Session.get 'noteChecked'
		userNotes = Session.get 'notes'
		selected = []

		checked.forEach (c, i) ->
			temp = _.findWhere(userNotes, {_id: c})
			selected.push temp

		checked.forEach (c, i) ->
			temp = _.reject(userNotes, (d) ->
				d._id is c
			)
			userNotes = temp
		Session.set 'notes', userNotes #SET AS CURRENTLY ACTIVE NOTIFICATIONS
		Session.set 'noteChecked', selected #REMOVE NOTE

Template._notifications.helpers
	notifications: ->
		Session.get 'notes'

	notificationNumber: ->
		n = Session.get 'notes'
		if n?.length then n.length else 0
