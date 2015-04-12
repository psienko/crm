App.PeopleNewRoute = Ember.Route.extend(

  setupController: (controller) ->
    controller.set 'fields', {}

  renderTemplate: ->
    @render
      into: 'people'
      outlet: 'newCustomer'
    return

  setupVisibility: ->
    @controllerFor('people').set 'showNewForm', 'show'
)