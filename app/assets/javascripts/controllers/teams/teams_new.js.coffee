App.TeamsNewController = Ember.Controller.extend(
  needs: ['teamsAddEmployee']
  isSaved: false
  isError: false

  actions:
    save: ->
      name = $('#nameNewTeam').val()
      team = @store.createRecord 'team', {teamName: name}
      _this = @
      team.save().then ->
        _this.set 'isSaved', true
      , ->
        _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false      
)
