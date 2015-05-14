App.Team =  DS.Model.extend

  teamName: DS.attr('string')
  employees: DS.hasMany('employee', {async: true})
  customers: DS.hasMany('customer', {async: true})
  receivedMessages: DS.hasMany('receivedMessage', {async: true})
  sentMessages: DS.hasMany('sentMessage', {async: true})

  icon: "<i class='fa fa-sitemap fa-lg'></i>"

  type: "Team"

  lowerTeamName: ( ->
    @get('teamName').toLowerCase
  ).property('teamName')

  fullName: ( ->
    @get('teamName')
  ).property('teamName')
