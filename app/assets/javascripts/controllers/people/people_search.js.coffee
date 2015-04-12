App.PeopleSearchController = Ember.Controller.extend(

  actions:
    search: ->
      person = @store.createRecord 'person', @get('fields')
      person.save()#.then =>
        #@transitionToRoute 'lead', lead
)
