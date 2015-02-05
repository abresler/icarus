Meteor.startup ->

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
      username: "client"
      password: "clientpassword"
      profile:
        first: "Client"
        last: "Name"
        roles: ["client"]

    Accounts.createUser
      username: "Icarus"
      password: "icaruspassword"
      profile:
        first: "David"
        last: "Pezzola"
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

  # Seeding the database with a property
  if Properties.find().count() is 0

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
      status: "complete"
      street: "14300 Kolin Ave"
      # termSheets: [
      # # dont need this... termsheet already has property reference.
      # ]
      yearBuilt: "1971"
      zestimate: "144031"
      zip: "60445"
      zpid: "4213212"


  # Seeding the database with a termsheet
  if TermSheets.find().count() is 0

    testclient = Meteor.users.findOne("username": "client")
    icarus = Meteor.users.findOne('username': "Icarus")
    property = Properties.findOne()

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
      property: property
      owner: testclient # assigning the owner to

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
      property: property
      owner: icarus # assigning the owner to




  # Seeding the database with the returns for three investors
  if Portfolios.find().count() is 0

    # First property. Two years of payments, no sale
    Portfolios.insert
      d: [
        {
          date: "1 January 2015"
          amount: 200
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 November 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 May 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 January 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 December 2013"
          amount: 200
          event: ""
        }
        {
          date: "1 November 2013"
          amount: 200
          event: ""
        }
        {
          date: "1 October 2013"
          amount: 200
          event: ""
        }
        {
          date: "1 September 2013"
          amount: 132
          event: "First debt payment for Property X"
        }
      ]
      e: [
        {
          date: "1 January 2015"
          amount: 344
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 344
          event: ""
        }
        {
          date: "1 November 2014"
          amount: 344
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 344
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 344
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 344
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 May 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 February 2014"
          amount: -120
          event: ""
        }
        {
          date: "1 January 2014"
          amount: -1200
          event: "Roof Collapsed"
        }
        {
          date: "1 December 2013"
          amount: 312
          event: ""
        }
        {
          date: "1 November 2013"
          amount: 312
          event: ""
        }
        {
          date: "1 October 2013"
          amount: 312
          event: "First equity payment for Property X"
        }
      ]
      ra: [
        {
          date: "1 January 2015"
          amount: 0
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 November 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 May 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 January 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 December 2013"
          amount: 0
          event: ""
        }
        {
          date: "1 November 2013"
          amount: 0
          event: ""
        }
        {
          date: "1 October 2013"
          amount: 0
          event: ""
        }
        {
          date: "1 September 2013"
          amount: -30000
          event: "Purchase of Property X"
        }
      ]
      ua: [
        {
          date: "1 January 2015"
          amount: 400
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 120
          event: ""
        }
        {
          date: "1 November 2014"
          amount: -1000
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 100
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 500
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 3000
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 1000
          event: ""
        }
        {
          date: "1 May 2014"
          amount: -1320
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 103
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 1244
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 1200
          event: ""
        }
        {
          date: "1 January 2014"
          amount: 1500
          event: ""
        }
        {
          date: "1 December 2013"
          amount: -1000
          event: ""
        }
        {
          date: "1 November 2013"
          amount: 1250
          event: ""
        }
        {
          date: "1 October 2013"
          amount: 1200
          event: ""
        }
        {
          date: "1 September 2013"
          amount: -30000
          event: "Purchase of Property X"
        }
      ]
      owner: "sam"
      property: "propertyx"



    # Second property. Two years of payments, sale
    Portfolios.insert
      d: [
        {
          date: "1 January 2015"
          amount: 140
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 November 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 May 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 January 2014"
          amount: 140
          event: ""
        }
        {
          date: "1 December 2013"
          amount: 140
          event: ""
        }
        {
          date: "1 November 2013"
          amount: 140
          event: ""
        }
        {
          date: "1 October 2013"
          amount: 140
          event: ""
        }
        {
          date: "1 September 2013"
          amount: 132
          event: "First debt payment for Property Y"
        }
      ]
      e: [
        {
          date: "1 January 2015"
          amount: 250
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 250
          event: ""
        }
        {
          date: "1 November 2014"
          amount: 250
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 250
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 250
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 250
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 230
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 230
          event: ""
        }
        {
          date: "1 May 2014"
          amount: 230
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 230
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 230
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 230
          event: ""
        }
        {
          date: "1 January 2014"
          amount: 230
          event: "Roof Collapsed"
        }
        {
          date: "1 December 2013"
          amount: 230
          event: ""
        }
        {
          date: "1 November 2013"
          amount: 230
          event: ""
        }
        {
          date: "1 October 2013"
          amount: 230
          event: "First equity payment for Property Y"
        }
      ]
      ra: [
        {
          date: "1 January 2015"
          amount: 80000
          event: "Sold Property Y"
        }
        {
          date: "1 December 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 November 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 May 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 January 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 December 2013"
          amount: 0
          event: ""
        }
        {
          date: "1 November 2013"
          amount: 0
          event: ""
        }
        {
          date: "1 October 2013"
          amount: 0
          event: ""
        }
        {
          date: "1 September 2013"
          amount: -30000
          event: "Purchase of Property Y"
        }
      ]
      ua: [
        {
          date: "1 January 2015"
          amount: 400
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 120
          event: ""
        }
        {
          date: "1 November 2014"
          amount: -1000
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 100
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 500
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 3000
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 1000
          event: ""
        }
        {
          date: "1 May 2014"
          amount: -1320
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 103
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 1244
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 1200
          event: ""
        }
        {
          date: "1 January 2014"
          amount: 1500
          event: ""
        }
        {
          date: "1 December 2013"
          amount: -1000
          event: ""
        }
        {
          date: "1 November 2013"
          amount: 1250
          event: ""
        }
        {
          date: "1 October 2013"
          amount: 1200
          event: ""
        }
        {
          date: "1 September 2013"
          amount: -30000
          event: "Purchase of Property Y"
        }
      ]
      owner: "sam"
      property: "propertyy"


    # Third property. One year of payments, no sale, refi, lots of issues
    Portfolios.insert
      d: [
        {
          date: "1 January 2015"
          amount: 200
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 November 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 May 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 January 2014"
          amount: 200
          event: ""
        }
      ]
      e: [
        {
          date: "1 January 2015"
          amount: 344
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 344
          event: ""
        }
        {
          date: "1 November 2014"
          amount: -1200
          event: "Furnace explosion"
        }
        {
          date: "1 October 2014"
          amount: -2500
          event: "Plumbing failure"
        }
        {
          date: "1 September 2014"
          amount: 344
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 344
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 May 2014"
          amount: -4000
          event: "Slip and fall lawsuit"
        }
        {
          date: "1 April 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 312
          event: ""
        }
        {
          date: "1 February 2014"
          amount: -120
          event: ""
        }
        {
          date: "1 January 2014"
          amount: -1200
          event: "Roof Collapsed"
        }
      ]
      ra: [
        {
          date: "1 January 2015"
          amount: 0
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 November 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 25000
          event: "Refinance"
        }
        {
          date: "1 July 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 May 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 0
          event: ""
        }
        {
          date: "1 January 2014"
          amount: -50000
          event: "Purchase of Property Z"
        }
      ]
      ua: [
        {
          date: "1 January 2015"
          amount: 400
          event: ""
        }
        {
          date: "1 December 2014"
          amount: 120
          event: ""
        }
        {
          date: "1 November 2014"
          amount: -1000
          event: ""
        }
        {
          date: "1 October 2014"
          amount: 100
          event: ""
        }
        {
          date: "1 September 2014"
          amount: 500
          event: ""
        }
        {
          date: "1 August 2014"
          amount: 200
          event: ""
        }
        {
          date: "1 July 2014"
          amount: 3000
          event: ""
        }
        {
          date: "1 June 2014"
          amount: 1000
          event: ""
        }
        {
          date: "1 May 2014"
          amount: -1320
          event: ""
        }
        {
          date: "1 April 2014"
          amount: 103
          event: ""
        }
        {
          date: "1 March 2014"
          amount: 1244
          event: ""
        }
        {
          date: "1 February 2014"
          amount: 1200
          event: ""
        }
        {
          date: "1 January 2014"
          amount: -50000
          event: "Purchase of Property Z"
        }
      ]
      owner: "sam"
      property: "propertyz"

# Properties.insert
#   d: [
#     {
#       d: 'five'
#       info: 'ten'
#     }
#     { in: 'bob' }
#   ]
#   x: []
