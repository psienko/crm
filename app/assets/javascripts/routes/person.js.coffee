App.PersonRoute = Ember.Route.extend

  model: (params) -> @store.find 'person', params.id
  