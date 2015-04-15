App.BusinessesSearchRoute = Ember.Route.extend(

  setupController: (controller) ->
    controller.set 'fields', {}

  renderTemplate: ->
    @render
      into: 'businesses'
      outlet: 'searchCustomer'
    return

  setupVisibility: ->
    @controllerFor('businesses').set 'showSearchForm', 'show'
)