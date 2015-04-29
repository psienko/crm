App.BusinessesEditTeamController = Ember.ObjectController.extend(
  isSaved: false
  isError: false
  
  selectedTeam: ( -> 
    @get('model.customer.team')
  ).property()

  teamsArray: ( -> 
    @get('store').all('team')
  ).property()

  modalDidChanged: (->
    @set 'selectedTeam', @get('model.team')
  ).observes('modal')

  actions:
    save: ->
      @set 'isError', false
      @set 'isSaved', false
      @set('model.customer.team', @get 'selectedTeam')
      _this = @
      @get('model.customer').save().then ->
        _this.set 'isSaved', true
        _this.get('store').find('business')
      , ->
        _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false   
)
