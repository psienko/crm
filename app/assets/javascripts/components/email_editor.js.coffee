App.EmailEditorComponent = Ember.Component.extend(
  
  afterRenderEvent: (->
    $(document).ready ->
      $('#newEmailTextarea').wysihtml5()
  )

  actions: 
    ok: (params)->
      @sendAction 'ok'
      return
)
