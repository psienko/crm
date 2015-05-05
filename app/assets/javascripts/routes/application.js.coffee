App.ApplicationRoute = Ember.Route.extend(actions:
  showModal: (name, model) ->
    @modalStart = 0
    @render name,
      into: 'application'
      outlet: 'modal'
      model: model
    return
  removeModal: ->
    @disconnectOutlet
      outlet: 'modal'
      parentView: 'application'
    return
)
