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

    describe 'isAdmin', ->

      beforeEach (done) ->
        Meteor.logout(done)
        return

      describe 'isAdmin for admin', ->
        it 'should work if user is admin', (done) ->
          Meteor.loginWithPassword "admin", "adminpassword", (err) ->
            temp = if Meteor.user().profile.roles.indexOf("admin") > -1 then true else false
            chai.expect(temp).to.equal(true)
            done()
            return
          return
        return

      describe 'isAdmin for client', ->
        it 'should not work for client', (done) ->
          Meteor.loginWithPassword "wofholdings", "wofpassword", (err) ->
            temp = if Meteor.user().profile.roles.indexOf("client") > -1 then false else true
            chai.expect(temp).to.equal(false)
            done()
            return
          return
        return

      describe 'isAdmin for guest', ->
        it 'should not work for guest', () ->
          temp = if Meteor.user()? then true else false
          chai.expect(temp).to.equal(false)
          return
        return

      describe 'isInvestor for client', ->
        it 'should not work for client', (done)->
          Meteor.loginWithPassword "wofholdings", "wofpassword", (err) ->
            temp = if Meteor.user().profile.roles.indexOf("client") > -1 then true else false
            chai.expect(temp).to.equal(true)
            done()
            return
          return
        return

      describe 'isInvestor for client', ->
        it 'should not work for client', (done)->
          Meteor.loginWithPassword "admin", "adminpassword", (err) ->
            temp = if Meteor.user().profile.roles.indexOf("admin") > -1 then false else true
            chai.expect(temp).to.equal(false)
            done()
            return
          return
        return

      describe 'isInvestor for guest', ->
        it 'should not work for guest', () ->
          temp = if Meteor.user()? then true else false
          chai.expect(temp).to.equal(false)
          return
        return


      return # for isAdmin

    return # return for MochaWeb
