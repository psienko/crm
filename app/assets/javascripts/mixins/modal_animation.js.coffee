App.animateModalClose = ->
  promise = new (Ember.RSVP.Promise)
  $('.modal.in').removeClass 'in'
  $('.modal-backdrop.in').removeClass 'in'
  setTimeout (->
    promise.resolve()
    return
  ), App.DEFAULT_CSS_TRANSITION_DURATION_MS
  promise

App.animateModalOpen = ->
  promise = new (Ember.RSVP.Promise)
  $('.modal').addClass 'in'
  $('.modal-backdrop').addClass 'in'
  setTimeout (->
    promise.resolve()
    return
  ), App.DEFAULT_CSS_TRANSITION_DURATION_MS
  promise
