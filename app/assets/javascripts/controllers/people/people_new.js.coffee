App.PeopleNewController = Ember.Controller.extend(
  isCreated: false

  actions:
    create: ->
      _this = @
      date = $('#dateOfBirth').val()
      if date != ''
        parts = date.split('/')
        newDate = new Date(parts[2],parts[1]-1, parts[0])
        newDate.setHours(12)
        @set 'fields.dateOfBirth', newDate
      person = @store.createRecord 'person', @get('fields')
      person.save().then ((person) ->
        _this.transitionToRoute 'person', person
      ), (errors) ->
        _this.set 'showError', true

    reset: ->
      @set 'fields', {}
)
