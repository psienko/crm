App.PeopleRoute = Ember.Route.extend

  model: -> @store.find 'person'