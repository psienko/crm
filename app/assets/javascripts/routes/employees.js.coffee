App.EmployeesRoute = Ember.Route.extend

  model: -> @store.find 'employee'
  