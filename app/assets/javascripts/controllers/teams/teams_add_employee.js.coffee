App.TeamsAddEmployeeController = Ember.ObjectController.extend(
  needs: ['teams']
  isSaved: false
  isError: false
  all: true
  unassigned: false

  loading: false

  employeesSaved: ( ->
    @get('store').all('employee')
  ).property()

  employees: ( -> 
    _this = @
    employees = ''
    @set 'loading', true
    (employees = @get('store').find('employee')).finally ->
                _this.set 'loading', false
    employees
  ).property()
  
  unassignedEmployees: ( -> 
    @get('employeesSaved').filterProperty('hasTeam', false)
  ).property('employeesSaved.@each.hasTeam')


  actions:
    showAll: ->
      @set 'all', true
      @set 'unassigned', false
      $( "#allTab" ).addClass( "active" )
      $( "#unassignedTab" ).removeClass( "active" )
      @set 'employees', @get('store').all('employee')

    showUnassigned: ->
      @set 'all', false
      @set 'unassigned', true
      $( "#unassignedTab" ).addClass( "active" )
      $( "#allTab" ).removeClass( "active" )
      @set 'employees', @get 'unassignedEmployees'


    add: (employee) ->
      isHasTeam = employee.get('team')
      if isHasTeam
        r = confirm("Czy na pewno przypisać tego pracownika, który należy juz do innej grupy?")
      if isHasTeam && r || !isHasTeam
        employee.set 'team', @get('model')
        _this = @
        employee.save().then ->
          if _this.get 'unassigned'
           _this.set 'employees', _this.get 'unassignedEmployees' 
          _this.set 'isSaved', true 
        , ->
          _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false      
)
