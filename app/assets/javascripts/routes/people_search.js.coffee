App.PeopleSearchRoute = Ember.Route.extend(

  setupController: (controller) ->
    controller.set 'fields', {}

  renderTemplate: ->
    @render
      into: 'people'
      outlet: 'searchCustomer'
    return

  setupVisibility: ->
    @controllerFor('people').set 'showSearchForm', 'show'
)