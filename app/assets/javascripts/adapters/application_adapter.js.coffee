# Override the default adapter with the `DS.ActiveModelAdapter` which

DS.RESTAdapter.reopen
  namespace: 'api'

App.ApplicationAdapter = DS.ActiveModelAdapter.extend()
