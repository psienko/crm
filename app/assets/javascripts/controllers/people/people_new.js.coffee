App.PeopleNewController = Ember.Controller.extend(

  actions:
    create: ->
      person = @store.createRecord 'person', @get('fields')
      person.save()#.then =>
        #@transitionToRoute 'lead', lead
)
