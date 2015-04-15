App.PeopleController = Ember.ArrayController.extend(
  search: false
  showNewForm: 'hide'
  showSearchForm: 'hide'
  needs: ['application', 'peopleSearch']
  currentPath: Ember.computed.alias('controllers.application.currentPath')

  people: ( ->
    if @get('search') then @get('searchedPeople') else @
  ).property('search', 'searchedPeople')

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

    restoreAllResult: ->
      @set 'search', false

)
