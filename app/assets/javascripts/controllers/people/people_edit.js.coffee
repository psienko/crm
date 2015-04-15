App.PeopleEditController = Ember.ObjectController.extend(
  isSaved: false
  isError: false
  actions:
    save: ->
      @set 'isError', false
      @set 'isSaved', false
      _this = @
      date = $('#dateOfBirthModal').val()
      if date != ''
        @set 'model.dateOfBirth', new Date(date)
      @get('model').save().then ->
        _this.set 'isSaved', true
      , ->
        _this.set 'isError', true
)
