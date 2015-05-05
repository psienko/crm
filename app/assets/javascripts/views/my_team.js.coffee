App.MyTeamView = Em.View.extend(

  didInsertElement: ->
    $(document).ready ->
      $('.wysihtml5').each (i, elem) ->
        $(elem).wysihtml5()
        return
    return
)