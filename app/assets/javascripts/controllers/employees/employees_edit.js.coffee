App.EmployeesEditController = Ember.ObjectController.extend(
  
  selectedTeam: ( -> 
    @get('model.team')
  ).property()

  teamsArray: ( ->
    @store.findAll 'team'
  ).property()

  modalDidChanged: (->
    @set 'selectedTeam', @get('model.team')
  ).observes('modal')
)
