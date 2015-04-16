App.BusinessesNewController = Ember.Controller.extend(
  isCreated: false
  allowAddContacts: true
  needs: ['businesses']

  actions:
    create: ->
      _this = @
      business = @store.createRecord 'business', @get('fields')
      business.save().then ((business) ->
        _this.transitionToRoute 'business', business
      ), (errors) ->
        _this.set 'showError', true

    reset: ->
      @set 'fields', {}
      @set 'contactsFields', []

    addContact: ->
      @get('contactsArray').pushObject(@get 'contactFields')
)
