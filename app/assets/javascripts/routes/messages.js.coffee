App.MessagesRoute = Ember.Route.extend(

  model: -> 
    return Em.RSVP.hash
      inboundMessages: @store.find('receivedMessage', {received_by: 'Employee'})
      outboundMessages: @store.find('sentMessage', {sent_by: 'Employee'})
  
  setupController: (controller, model) ->
    controller.set('content', model)
    controller.set 'isShowedSent', false
    controller.set 'isShowedCreate', false
    controller.set 'isShowedReceived', true
    controller.set 'fields', {} 
    controller.setProperties model
)