###
Things you can use with Chai

chai.assert.typeOf(foo, 'string', 'foo is a string')
chai.assert.equal(foo, 'bar', 'foo equal bar')
chai.assert.lengthOf(foo, 3, 'foo should have a length of 3')

chai.expect(foo).to.be.a('string')
expect(foo).to.equal('bar')
expect(foo).to.have.length(3)
expect(beverages).to.have.property('tea').with.length(3)
###



if !(typeof MochaWeb == 'undefined')
  MochaWeb.testOnly ->

    describe 'isAdmin for admin', ->
      it 'should work if user is admin', ->
        # Meteor.user()?.profile.roles.indexOf("admin") > -1 then true else false

        # then going to test if user is admin

        # create client
        # log in as client
        # test if user is admin

        # test if user who isnt logged in has access
        temp = undefined
        Meteor.loginWithPassword "admin", "adminpassword", (err) ->
          # alert "Incorrect admin", 3000 if err
          temp = if Meteor.user()?.profile.roles.indexOf("admin") < -1 then true else false
          Meteor.logout()
          chai.expect(temp).to.equal(true)
          return

        return
      return

    describe 'isAdmin for client', ->
      it 'should not work for client', ->

        Meteor.loginWithPassword "client", "clientpassword", (err) ->
          alert "Incorrect client password", 3000 if err
          console.log Meteor.user()
          Meteor.logout()
        return
      return



    return # return for MochaWeb
