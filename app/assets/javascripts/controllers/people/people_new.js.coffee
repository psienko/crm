App.PeopleNewController = Ember.Controller.extend(
  isCreated: false

  actions:
    create: ->
      _this = @
      date = $('#dateOfBirth').val()
      if date != ''
        @set 'fields.dateOfBirth', new Date(date)
      person = @store.createRecord 'person', @get('fields')
      person.save().then ((person) ->
        _this.transitionToRoute 'person', person
      ), (errors) ->
        _this.set 'showError', true

    reset: ->
      @set 'fields', {}
)
