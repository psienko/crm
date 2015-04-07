App.CustomerModalsController = Ember.ObjectController.extend(
  #edit: (record) ->
   # record.on 'didUpdate', this, ->
    #  @send 'closeModal'
     # return
    #@set 'model', record
    #return
  #save: ->
   # @get('model.transaction').commit()
    #return
#)
   edit:  ->
    #record.on 'didUpdate', this, ->
     # @send 'closeModal'
      #return
    @set 'model'
    return
  save: ->
    @get('model.transaction').commit()
    return
)

App.SettingsModalController = Ember.ObjectController.extend(actions: save: ->
  # save to server
  return
)

App.LogoutModalController = Ember.Controller.extend(actions: logout: ->
  alert 'logout'
  return
)

App.IndexRoute = Ember.Route.extend(model: ->
  Ember.Object.create name: 'My name'
)