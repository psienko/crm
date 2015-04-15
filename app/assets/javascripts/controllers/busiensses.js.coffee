App.BusinessesController = Ember.ArrayController.extend(
  search: false
  showNewForm: 'hide'
  showSearchForm: 'hide'
  needs: ['application']
  currentPath: Ember.computed.alias('controllers.application.currentPath')

  businesses: ( ->
    if @get('search') then @get('searchedBusinesses') else @
  ).property('search', 'searchedBusinesses')

  hideIndex : (->
      @get('currentPath') == "customers.businesses.business"
  ).property('currentPath')

  routeDidChanged: (->
    @set('hideIndex', @get('currentPath') == "customers.businesses.business")
  ).observes('controllers.application.currentPath')

  actions:
    changeVisibilityNewForm: ->
      @set('showSearchForm', 'hide')
      if @get('showNewForm') == 'hide'
        className = 'show'
      else
        className = 'hide'
      @set('showNewForm', className)
      @transitionToRoute("businesses.new")

    changeVisibilitySearchForm: ->
      @set('showNewForm', 'hide')
      if @get('showSearchForm') == 'hide' 
        className='show' 
      else
        className = 'hide'
      @set('showSearchForm', className)
      @transitionToRoute("businesses.search")

    restoreAllResult: ->
      @set 'search', false

)
