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

    Accounts.createUser
      username: 'testclient'
      password: 'testclientpassword'
      profile:
        first: "Test"
        last: "Client"
        roles: ['client']
        email: "samcorcos@gmail.com"
        telephone: "4155154630"
        

  if Properties.find().count() is 0

    # clientId = Meteor.users.find()
    # adminId = Meteor.users.find()

    Properties.insert
      bath: "3.0"
      bed: "3"
      city: "Midlothian"
      imagesArray: [
        "http://photos2.zillowstatic.com/p_d/IS-1n85aotvpsxgd.jpg"
        "http://photos2.zillowstatic.com/p_d/IS-1n85aiwsdn04d.jpg"
        "http://photos3.zillowstatic.com/p_d/IS-aujpiwl6wod9.jpg"
        "http://photos2.zillowstatic.com/p_d/IS-1n85b6l5qapgd.jpg"
        "http://photos1.zillowstatic.com/p_d/IS-aujv1qxbjqsd.jpg"
      ]
      lat: "41.632556"
      long: "-87.726905"
      lotSizeSqft: "6783"
      owners: [
        "bob"
        "mike"
      ]
      purchaseDate: "2015-01-01T00:00:00-05:00"
      rooms: "Recreation room, Family room, Laundry room, Master bath"
      sqft: "1215"
      state: "IL"
      street: "14300 Kolin Ave"
      yearBuilt: "1971"
      zestimate: "144031"
      zip: "60445"
      zpid: "4213212"
