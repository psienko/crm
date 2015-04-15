App.BusinessesSearchController = Ember.Controller.extend(
  needs: ['businesses']
  search: false

  actions:
    search: ->
      _this = @
      @get('store').find('business', {business: @get('fields'), search: 'search'}).then ((response) ->
        _this.set('controllers.businesses.search', true)
        _this.set('controllers.businesses.searchedBusinesses', response)
      )
      @set 'search', true
      @set 'controllers.businesses.showSearchForm', 'hide'

    reset: ->
      @set 'fields', {}
)
