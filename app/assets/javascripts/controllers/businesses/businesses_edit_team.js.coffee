App.BusinessesEditTeamController = Ember.ObjectController.extend(
  isSaved: false
  isError: false
  isLoading: false
  
  selectedTeam: ( -> 
    @get 'model.customer.team.content'
  ).property()

  teamsArray: ( ->
    _this = @
    @set 'isLoading', true
    (teams = @store.findAll 'team').finally ->
                _this.set 'isLoading', false
    teams
  ).property()

  modalDidChanged: (->
    @set 'selectedTeam', @get('model.customer.team.content')
  ).observes('modal')

  actions:
    save: ->
      @set 'isError', false
      @set 'isSaved', false
      @set('model.customer.team', @get('selectedTeam'))
      _this = @
      @get('model.customer.content').save().then ->
        _this.set 'isSaved', true
        _this.get('store').find('business')
      , ->
        _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false   
)
