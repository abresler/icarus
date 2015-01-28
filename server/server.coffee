Meteor.startup ->
  if Meteor.users.find().count() is 0

    Accounts.createUser
      username: "admin"
      password: "adminpassword"
      profile:
        first: "Admin"
        last: "Name"
        roles: ["admin"]

    Accounts.createUser
      username: "client"
      password: "clientpassword"
      profile:
        first: "Client"
        last: "Name"
        roles: ["client"]
