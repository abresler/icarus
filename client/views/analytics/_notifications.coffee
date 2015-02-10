Template._notifications.rendered = ->
	Session.setDefault 'notice', []
	userID = Meteor.user()._id
	userNotes = []
	allNotes = Notifications.find().fetch()

	allNotes.forEach (d, i) ->
		if _.contains(d.investors, userID) then userNotes.push(d)

	Session.set 'notice', userNotes

Template._notifications.helpers
	notifications: ->
		Session.get 'notice'

	notificationNumber: ->
		n = Session.get 'notice'
		n.length



