App.BusinessRoute = Ember.Route.extend

  model: (params) -> @store.find 'business', params.id
  