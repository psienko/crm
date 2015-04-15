App.BusinessesNewRoute = Ember.Route.extend(

  setupController: (controller) ->
    controller.set 'fields', {}
    controller.set 'showError', false

  renderTemplate: ->
    @render
      into: 'businesses'
      outlet: 'newCustomer'
    return

  setupVisibility: ->
    @controllerFor('businesses').set 'showNewForm', 'show'
)
