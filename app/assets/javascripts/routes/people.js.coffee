App.PeopleRoute = Ember.Route.extend

  model: -> @store.find 'person'
  activateNewForm:   -> @controllerFor('people').set 'showNewForm', true
  activateSearchForm:   -> @controllerFor('people').set 'showSearchForm', true
  activateCurrentPath: -> @controllerFor('people').setCurrentPath