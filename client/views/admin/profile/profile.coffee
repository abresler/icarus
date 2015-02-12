Template._investorProfile.helpers
  properties: ->
    investorId = Template.currentData()._id
    Properties.find
      owners: investorId
