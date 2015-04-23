App.Team =  DS.Model.extend

  teamName: DS.attr('string')
  employees: DS.hasMany('employee')

  lowerTeamName: ( ->
    @get('teamName').toLowerCase
  ).property('teamName')

