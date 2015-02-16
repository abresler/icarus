Template._managePotentialProjects.rendered = ->
  Session.set 'editingProjects', false

Template._managePotentialProjects.events
  'click #add-project-button': (e,t) ->
    e.preventDefault()
    Session.set 'editingProjects', true

  'click #submit-project': (e,t) ->
    e.preventDefault()
    if t.find('#zpid-project').value and t.find('#debt-needed').value and t.find('#equity-needed').value and t.find('#debt-roi').value and t.find('#equity-roi').value

      Meteor.call 'getProperty', +t.find('#zpid-project').value, (err,res) ->
        if err then alert "Error with Zillow API call."

        else
          x = res["Zestimate:zestimate"]["response"]["0"]
          tempOwners = Session.get 'ownersList'
          owners = _.keys(tempOwners)

          Properties.insert
            street: x["address"]["0"]["street"]["0"]
            city: x["address"]["0"]["city"]["0"]
            lat: x["address"]["0"]["latitude"]["0"]
            long: x["address"]["0"]["longitude"]["0"]
            state: x["address"]["0"]["state"]["0"]
            zip: x["address"]["0"]["zipcode"]["0"]
            zestimate: x["zestimate"]["0"]["amount"]["0"]["_"]
            zpid: x["zpid"]["0"]
            needed:
              debt: +t.find('#debt-needed').value
              equity: +t.find('#equity-needed').value
              debtROI: +t.find('#debt-roi').value
              equityROI: +t.find('#equity-roi').value
            status: "pending"

          $('#zpid-project').val('')
          $('#debt-needed').val('')
          $('#equity-needed').val('')
          $('#debt-roi').val('')
          $('#equity-roi').val('')

          alert "Successfully added project!"
    else alert "Please enter the necessary data!"

Template._managePotentialProjects.helpers
  allPending: ->
    Properties.find(status: 'pending')

  editingProjects: ->
    Session.get 'editingProjects'
