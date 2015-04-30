App.Team =  DS.Model.extend

  teamName: DS.attr('string')
  employees: DS.hasMany('employee')
  customers: DS.hasMany('customer')

  lowerTeamName: ( ->
    @get('teamName').toLowerCase
  ).property('teamName')
