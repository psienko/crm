App.MyTeamRoute = Ember.Route.extend(
  model: ->
    _this = @
    @controllerFor('application').get('userInfo').then (user) ->
      return Em.RSVP.hash
        team: _this.store.find 'team', user.get('team.id')
        inboundMessages: _this.store.find('receivedMessage', {received_by: 'Team'})
        outboundMessages: _this.store.find('sentMessage', {sent_by: 'Team'})
    

  setupController: (controller, model) ->
    controller.set('content', model)
    controller.set 'isShowedPeople', true
    controller.set 'isShowedBusinesses', false
    controller.set 'isShowedSent', false
    controller.set 'isShowedReceived', true
    controller.setProperties model
)
