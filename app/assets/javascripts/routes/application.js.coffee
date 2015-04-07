#App.ApplicationRoute = Ember.Route.extend(events:
  #openModal: (modal) ->
   # @render modal,
    #  into: 'application'
     # outlet: 'modal'
    #return
  #closeModal: ->
   # App.animateModalClose().then (->
    #  @render 'empty',
     #   into: 'application'
      #  outlet: 'modal'
      #return
    #).bind(this)
    #return
#)

App.ApplicationRoute = Ember.Route.extend(actions:
  showModal: (name, model) ->
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