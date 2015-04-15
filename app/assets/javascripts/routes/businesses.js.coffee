App.BusinessesRoute = Ember.Route.extend

  model: -> @store.find 'business'
  activateNewForm:   -> @controllerFor('businesses').set 'showNewForm', true
  activateSearchForm:   -> @controllerFor('businesses').set 'showSearchForm', true
  activateCurrentPath: -> @controllerFor('businesses').setCurrentPath