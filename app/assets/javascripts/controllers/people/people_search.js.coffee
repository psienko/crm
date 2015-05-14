App.PeopleSearchController = Ember.Controller.extend(
  needs: ['people']
  search: false

  actions:
    search: ->
      _this = @
      date = $('#dateOfBirth').val()
      if date != ''
        parts = date.split('/')
        @set 'fields.dateOfBirth', new Date(parts[2],parts[1]-1, parts[0]).toString()
      @get('store').find('person', {person: @get('fields'), search: 'search'}).then ((response) ->
        _this.set 'fields.dateOfBirth', date
        _this.set('controllers.people.search', true)
        _this.set('controllers.people.searchedPeople', response)
      )
      @set 'search', true
      @set 'controllers.people.showSearchForm', 'hide'

    reset: ->
      @set 'fields', {}
)
