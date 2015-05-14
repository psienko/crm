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
        parts = date.split('/')
        newDate = new Date(parts[2],parts[1]-1, parts[0])
        newDate.setHours(12)
        @set 'model.dateOfBirth', newDate
      @get('model').save().then ->
        _this.set 'isSaved', true
      , ->
        _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false
)
