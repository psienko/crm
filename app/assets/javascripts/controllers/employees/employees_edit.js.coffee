App.EmployeesEditController = Ember.ObjectController.extend(
  isSaved: false
  isError: false
  isLoading: false


  selectedTeam: ( ->
    @get('model.team')
  ).property()

  teamsArray: ( ->
    _this = @
    @set 'isLoading', true
    #@store.findAll 'team'
    (teams = @store.findAll 'team').finally ->
                _this.set 'isLoading', false
    teams
  ).property()

  modalDidChanged: (->
    @set 'selectedTeam', @get('model.team')
  ).observes('modal')

  actions:
    save: ->
      @set 'isError', false
      @set 'isSaved', false
      @set('model.team', @get 'selectedTeam')
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
