App.TeamsEditController = Ember.ObjectController.extend(
  needs: ['teams']
  isSaved: false
  isError: false

  actions:
    removeEmployee: (employee, team) ->
      r = confirm("Czy na pewno usunąc tego pracownika z grupy?")
      if r
        team.get('employees').removeObject(employee)
        employee.set 'team', null
        employee.save()

    changeName: ->
      @set 'isError', false
      @set 'isSaved', false
      _this = @
      @get('model').save().then ->
        _this.set 'isSaved', true
      , ->
        _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false      
)
