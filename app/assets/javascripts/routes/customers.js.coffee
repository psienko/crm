App.CustomersRoute = Ember.Route.extend

  model: -> @store.find 'customer'

#App.CustomersRoute = Ember.Route.extend(events: edit: (customer) ->
  #@controllerFor('customer.modals').edit customer
  #@send 'openModal', 'customers.modal'
  #return
#)