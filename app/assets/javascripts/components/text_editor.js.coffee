App.TextEditorComponent = Ember.Component.extend(
  
  init: (->
    $(document).ready ->
      $('.wysihtml5').each (i, elem) ->
        $(elem).wysihtml5()
        return
      return
  )
)