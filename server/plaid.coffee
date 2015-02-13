Meteor.methods
	getBank: () ->
		# future = new Future()
		result = Meteor.http.call "POST", "https://tartan.plaid.com/connect/step", {
			data:
				client_id: 'test_id',
				secret: 'test_secret',
				access_token: 'test',
				mfa: 'tomato',
				type: 'usaa'
		}, (err, response) ->
			if err then console.log err
			Bank.insert
				data: response
			# result = response
		result

		# result = future.wait()