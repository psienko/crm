App.BusinessesRoute = Ember.Route.extend

  model: -> @store.find 'business'