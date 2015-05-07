App.MyTeamView = Em.View.extend(

  afterRenderEvent: ->
    $(document).ready ->
      $('.wysihtml5').each (i, elem) ->
        $(elem).wysihtml5()
      do ->
        $('.message').click ->
          alert($('.message').prop('outerHTML'))
          alert event.target.id
          return
        return
      return

)