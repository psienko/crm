App.MessagesRoute = Ember.Route.extend

  model: -> @store.find 'message'
  