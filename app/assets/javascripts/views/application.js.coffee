App.ApplicationView = Em.View.extend(

  afterRenderEvent: ->
    $('#teamCounter').parent().parent().click ->
      if window.teamMessages > 0
        setTimeout (->
          window.startedTeam = false
          window.teamMessages = 0
          $('#teamCounter').addClass('hide') unless $('#teamCounter').hasClass('hide')
        ),1000
      
    $('#employeeCounter').parent().click ->
      if window.emplMessages > 0
        setTimeout (->
          window.startedEmployee = false
          window.emplMessages = 0
          $('#employeeCounter').addClass('hide') unless $('#employeeCounter').hasClass('hide')
        ),1000
)