App.Team =  DS.Model.extend

  teamName: DS.attr('string')
  employees: DS.hasMany('employee')
  customers: DS.hasMany('customer')
  receivedMessages: DS.hasMany('receivedMessage')
  sentMessages: DS.hasMany('sentMessage')

  icon: DS.attr('icon', {defaultValue: "<i class='fa fa-envelope fa-lg'></i>"})

  lowerTeamName: ( ->
    @get('teamName').toLowerCase
  ).property('teamName')

  fullName: ( ->
    @get('teamName')
  ).property('teamName')
