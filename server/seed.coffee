Meteor.startup ->

  # after a Properties.insert, set these values to the mongo ID so they can be used in Portolios (and term sheet?)
  property1 = undefined
  property2 = undefined
  property3 = undefined

  # Seeding the database with new users
  if Meteor.users.find().count() is 0

    Accounts.createUser
      username: "admin"
      password: "adminpassword"
      profile:
        first: "Admin"
        last: "Name"
        roles: ["admin"]

    Accounts.createUser
      username: "Icarus"
      password: "icaruspassword"
      profile:
        first: "David"
        last: "Pezzola"
        roles: ["client"]

    Accounts.createUser
      username: 'samcorcos'
      password: 'sampassword'
      profile:
        first: "Sam"
        last: "corcos"
        roles: ['client']
        email: "samcorcos@gmail.com"
        telephone: "4155154630"

    Accounts.createUser
      username: 'johnoreilly'
      password: 'johnpassword'
      profile:
        first: "John"
        last: "O'Reilly"
        roles: ['client']
        email: 'john@oreillyinvestments.com'
        telephone: '2124245231'

    Accounts.createUser
      username: 'wofholdings'
      password: 'wofpassword'
      profile:
        first: "Leon"
        last: 'Gillies'
        roles: ['client']
        email: 'leon@wofholdings.com'
        telephone: '4154839933'

  # Seeding the database with a property
  # if Properties.find().count() is 0
  #   owner = Meteor.users.findOne( username: "Icarus")._id
  #   owner2 = Meteor.users.findOne( username: "wofholdings")._id

  #   property1 = Properties.insert
  #     bath: "3.0"
  #     bed: "3"
  #     city: "Midlothian"
  #     imagesArray: [
  #       "http://photos2.zillowstatic.com/p_d/IS-1n85aotvpsxgd.jpg"
  #       "http://photos2.zillowstatic.com/p_d/IS-1n85aiwsdn04d.jpg"
  #       "http://photos3.zillowstatic.com/p_d/IS-aujpiwl6wod9.jpg"
  #       "http://photos2.zillowstatic.com/p_d/IS-1n85b6l5qapgd.jpg"
  #       "http://photos1.zillowstatic.com/p_d/IS-aujv1qxbjqsd.jpg"
  #     ]
  #     lat: "41.632556"
  #     long: "-87.726905"
  #     lotSizeSqft: "6783"
  #     owners: [
  #       owner
  #       owner2
  #     ]
  #     purchaseDate: "2015-01-01T00:00:00-05:00"
  #     rooms: "Recreation room, Family room, Laundry room, Master bath"
  #     sqft: "1215"
  #     state: "IL"
  #     status: "complete"
  #     street: "14300 Kolin Ave"
  #     yearBuilt: "1971"
  #     zestimate: "144031"
  #     zip: "60445"
  #     zpid: "4213212"

  #   property2 = Properties.insert
  #     city: "Talent"
  #     lat: "42.250025"
  #     long: "-133.786568"
  #     owners: [
  #       owner
  #       owner2
  #     ]
  #     state: "OR"
  #     status: "complete"
  #     street: "230 Autumn Ridge Dr"
  #     zestimate: "258932"
  #     zip: "97540"
  #     zpid: "48363984"

  #   property3 = Properties.insert
  #     city: "Canton"
  #     lat: "44.601894"
  #     long: "-75.174200"
  #     owners: [
  #       owner
  #       owner2
  #     ]
  #     state: "NY"
  #     status: "complete"
  #     street: "10 Fairlane Dr"
  #     zestimate: "113497"
  #     zip: "13617"
  #     zpid: "32533232"

  # Seeding the database with a termsheet
  if TermSheets.find().count() is 0

    wof = Meteor.users.findOne("username": "wofholdings")
    icarus = Meteor.users.findOne('username': "Icarus")

    TermSheets.insert
      purchasePrice: 38000
      downPaymentPerc: 100
      closingRepair: 20000
      apr: 5.5
      taxes: 1000
      hoa: 200
      insurance: 100
      rentPrice: 1400
      equityPerc: 60
      capitalPercNeeded: 60
      property: property1
      owner: wof # assigning the owner to

    TermSheets.insert
      purchasePrice: 38000
      downPaymentPerc: 100
      closingRepair: 20000
      apr: 5.5
      taxes: 1000
      hoa: 200
      insurance: 100
      rentPrice: 1400
      equityPerc: 40
      capitalPercNeeded: 60
      property: property1
      owner: icarus # assigning the owner to




  # Seeding the database with the returns for three investors
  if Portfolios.find().count() is 0

    wof = Meteor.users.findOne("username": "wofholdings")
    icarus = Meteor.users.findOne('username': "Icarus")

    # First property
    Portfolios.insert
      type: "debt"
      date: "15 January 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 February 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 March 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 April 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 May 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 June 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 July 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 August 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 September 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 October 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 November 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 December 2014"
      amount: 150
      owner: wof
      property: property1
      event: ""
      notes: ""



    # First property. Equity
    Portfolios.insert
      type: "equity"
      date: "15 January 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 February 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 March 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 April 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 May 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 June 2014"
      amount: -400
      owner: wof
      property: property1
      event: "Roof damage from storm"
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 July 2014"
      amount: -100
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 August 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 September 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 October 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 November 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 December 2014"
      amount: 240
      owner: wof
      property: property1
      event: ""
      notes: ""





    # Second property debt returns





    Portfolios.insert
      type: "debt"
      date: "15 January 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 February 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 March 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 April 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 May 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 June 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 July 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 August 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 September 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 October 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 November 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 December 2014"
      amount: 180
      owner: wof
      property: property2
      event: ""
      notes: ""




    Portfolios.insert
      type: "equity"
      date: "15 January 2014"
      amount: 340
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 February 2014"
      amount: 330
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 March 2014"
      amount: 340
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 April 2014"
      amount: 340
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 May 2014"
      amount: 340
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 June 2014"
      amount: 190
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 July 2014"
      amount: 340
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 August 2014"
      amount: 280
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 September 2014"
      amount: 340
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 October 2014"
      amount: 340
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 November 2014"
      amount: 290
      owner: wof
      property: property2
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 December 2014"
      amount: 340
      owner: wof
      property: property2
      event: ""
      notes: ""




      # Property 3 debt returns

    Portfolios.insert
      type: "debt"
      date: "15 January 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 February 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 March 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 April 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 May 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 June 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 July 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 August 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 September 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 October 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 November 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "debt"
      date: "15 December 2014"
      amount: 150
      owner: wof
      property: property3
      event: ""
      notes: ""


    Portfolios.insert
      type: "equity"
      date: "15 January 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 February 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 March 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 April 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 May 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 June 2014"
      amount: 240
      owner: wof
      property: property3
      event: "Roof damage from storm"
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 July 2014"
      amount: 100
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 August 2014"
      amount: 200
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 September 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 October 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 November 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "equity"
      date: "15 December 2014"
      amount: 240
      owner: wof
      property: property3
      event: ""
      notes: ""

    Portfolios.insert
      type: "asset"
      date: "15 October 2013"
      amount: 120000
      owner: wof
      property: property1
      event: "Purchase property 1"
      notes: ""

    Portfolios.insert
      type: "asset"
      date: "15 November 2014"
      amount: 140000
      owner: wof
      property: property1
      event: "Sale of property 1"

    Portfolios.insert
      type: "asset"
      date: "15 January 2014"
      amount: 220000
      owner: wof
      property: property2
      event: "Purchase property 2"

    Portfolios.insert
      type: "asset"
      date: "15 February 2014"
      amount: 110000
      owner: wof
      property: property3
      event: "Purchase property 3"





###

Still to do:

Equity and debt for two more properties (3 total) --done
Property purchase events --
Property sale events

###
