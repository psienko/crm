App.MyTeamRoute = Ember.Route.extend(
  #model: -> @store.find 'team', Ember.computed.alias('controllers.application.userInfo.id')
  model: ->
    Em.RSVP.hash
      team: @store.find 'team', window.currentEmployeeId
      inboundMessages: @store.find('receivedMessage', {received_by: 'Team'})
      outboundMessages: @store.find('sentMessage', {sent_by: 'Team'})

  setupController: (controller, model) ->
    controller.set('content', model)
    controller.set 'isShowedPeople', true
    controller.set 'isShowedBusinesses', false
    controller.setProperties model
    #controller.set 'inboundMessages', @store.find('receivedMessage', {received_by: 'Team'})
    #controller.set 'outboundMessages', @store.find('sentMessage', {sent_by: 'Team'})
    #console.log(model.get 'team.teamName')
)
