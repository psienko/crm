App.PeopleNewRoute = Ember.Route.extend(

  setupController: (controller) ->
    controller.set 'fields', {}
    controller.set 'showError', false

  renderTemplate: ->
    @render
      into: 'people'
      outlet: 'newCustomer'
    return

  setupVisibility: ->
    @controllerFor('people').set 'showNewForm', 'show'
)
