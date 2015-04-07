App.WidgetsRoute = Em.Route.extend(events: edit: (widget) ->
  @controllerFor('widgets.modal').edit widget
  @send 'openModal', 'widgets.modal'
  return
)