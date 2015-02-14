Meteor.methods
  createNewUser: (first, last, username, email, telephone) ->
    Accounts.createUser
      username: username
      password: "password"
      profile:
        first: first
        last: last
        email: email
        telephone: telephone
        roles: ["client"]
