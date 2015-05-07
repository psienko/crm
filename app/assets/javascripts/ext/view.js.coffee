Ember.View.reopen
  didInsertElement: ->
    @_super()
    Ember.run.scheduleOnce 'afterRender', this, @afterRenderEvent
    return
  afterRenderEvent: ->
  