App.MyTeamRoute = Ember.Route.extend(
  setupController: (controller) ->
    controller.set 'isShowedPeople', true
    controller.set 'isShowedBusinesses', false
)
