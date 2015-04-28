App.TeamsAddEmployeeController = Ember.ObjectController.extend(
  needs: ['teams']
  isSaved: false
  isError: false
  all: true
  unassigned: false

  employees: ( -> 
    @get('store').find('employee')
  ).property()


  actions:
    showAll: ->
      @set 'all', true
      @set 'unassigned', false
      $( "#allTab" ).addClass( "active" )
      $( "#unassignedTab" ).removeClass( "active" )
      @set 'employees', @get('store').find('employee')

    showUnassigned: ->
      @set 'all', false
      @set 'unassigned', true
      $( "#unassignedTab" ).addClass( "active" )
      $( "#allTab" ).removeClass( "active" )
      @set 'employees', @get('store').find('employee', {team: 'unassigned'})


    add: (employee) ->
      isHasTeam = employee.get('team')
      if isHasTeam
        r = confirm("Czy na pewno przypisać tego pracownika, który należy juz do innej grupy?")
      if isHasTeam && r || !isHasTeam
        employee.set 'team', @get('model')
        _this = @
        employee.save().then ->
          _this.set 'isSaved', true 
        , ->
          _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false      
)
