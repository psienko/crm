#= require jquery
#= require jquery_ujs
#= require functions
#=require bootstrap-sprockets
#= require handlebars
#= require ember
#= require bootstrap-wysihtml5
#= require bootstrap-wysihtml5/locales/pl-PL
#= require ember-data
#= require bootstrap-datepicker
#= require moment
#= require_self
#= require app


# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create(
  rootElement: '#ember-app'
  currentPath: ''
)

$('.dropdown-toggle').dropdown()

$('datepickerClass').datepicker ->
  dateFormat: "dd-mm-YYYY"
#getter
dateFormat = $( ".selector" ).datepicker( "option", "dateFormat" )
 
#Setter
$( ".selector" ).datepicker( "option", "dateFormat", "yy-mm-dd" )

$ ->
  dates = $('datepickerClass').datepicker(
    dateFormat: 'dd/mm/yy'
    defaultDate: '+1w'
    changeMonth: false
    numberOfMonths: 1
    showOn: 'both'
    buttonImage: 'contact/calendar/calendar.gif'
    buttonImageOnly: true
    onSelect: (selectedDate) ->
      option = if @id == 'from' then 'minDate' else 'maxDate'
      instance = $(this).data('datepicker')
      date = $.datepicker.parseDate(instance.settings.dateFormat or $.datepicker._defaults.dateFormat, selectedDate, instance.settings)
      dates.not(this).datepicker 'option', option, date
      return
  )
  return


window.startedTeam = false
window.startedEmployee = false

getCounter = (->
  $.ajax
    type: 'GET'
    url: '/api/v2/messages_counters'
    dataType: 'json'
    success: (data) ->
      unless window.startedEmployee
        window.startEmplMessC = data.empl_messages
        window.startedEmployee = true
      else
        window.emplMessages = data.empl_messages - window.startEmplMessC
        if window.emplMessages > 0
          $('#employeeCounter').removeClass('hide') if $('#employeeCounter').hasClass('hide')
          $('#employeeCounter').text(window.emplMessages)
        else
          $('#employeeCounter').addClass('hide') unless $('#employeeCounter').hasClass('hide')
      
      unless window.startedTeam
        window.startTeamMessC = data.team_messages
        window.startedTeam = true
      else
        window.teamMessages = data.team_messages - window.startTeamMessC
        if window.teamMessages > 0
          $('#teamCounter').removeClass('hide') if $('#teamCounter').hasClass('hide')
          $('#teamCounter').text(window.teamMessages)
        else
          $('#teamCounter').addClass('hide') unless $('#teamCounter').hasClass('hide')
    complete: -> setTimeout getCounter, 45000
)

$(document).ready ->
  setTimeout getCounter, 45000
  return




