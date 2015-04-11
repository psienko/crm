App.PeopleController = Ember.ArrayController.extend(
  showNewForm: false
  showSearchForm: false
  needs: ['application']
  currentPath: Ember.computed.alias('controllers.application.currentPath')

  hideIndex : (->
      @get('currentPath') == "customers.people.person"
  ).property('currentPath')

  routeDidChanged: (->
    @set('hideIndex', @get('currentPath') == "customers.people.person")
  ).observes('controllers.application.currentPath')

  actions:
    changeVisibilityNewForm: ->
      @.set('showNewForm', !@.get('showNewForm'))

    changeVisibilitySearchForm: ->
      @.set('showSearchForm', !@.get('showSearchForm'))

)