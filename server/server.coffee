Meteor.startup ->
  if Meteor.users.find().count() is 0

    Accounts.createUser
      username: "admin"
      password: "adminpassword"
      profile:
        roles: ["admin"]

    Accounts.createUser
      username: "client"
      password: "clientpassword"
      profile:
        roles: ["client"]
