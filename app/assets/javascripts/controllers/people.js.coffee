App.PeopleController = Ember.ArrayController.extend(
  showNewForm: 'hide'
  showSearchForm: 'hide'
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
      @set('showSearchForm', 'hide')
      if @get('showNewForm') == 'hide'
        className = 'show'
      else
        className = 'hide'
      @set('showNewForm', className)
      @transitionToRoute("people.new")

    changeVisibilitySearchForm: ->
      @set('showNewForm', 'hide')
      if @get('showSearchForm') == 'hide' 
        className='show' 
      else
        className = 'hide'
      @set('showSearchForm', className)
      @transitionToRoute("people.search")
)
