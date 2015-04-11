App.ApplicationController = Ember.Controller.extend(
  format: 'DD/MM/YYY'
  date: null
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
