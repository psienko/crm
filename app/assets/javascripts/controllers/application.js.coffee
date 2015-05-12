App.ApplicationController = Ember.Controller.extend(
  needs:['person']
  format: 'DD/MM/YYY'
  date: null
  userInfo: null

  init: ->
    @set 'userInfo', @store.find('employee', window.currentEmployeeId)
    @set 'userTeamId', @get 'userInfo.team.id'
    return

  formattedDate: (->
    date = @get('date')
    format = @get('format')
    moment(date).format format
  ).property('date', 'format')

  updateCurrentPath: (->
    App.set 'currentPath', @get('currentPath')
    return
  ).observes('currentPath')
)
