App.BusinessesNewController = Ember.Controller.extend(
  isCreated: false
  allowAddContacts: true
  needs: ['businesses']

  actions:
    create: ->
      _this = @
      @set 'fields.contacts', fromHashToString(@get('contactsArray'))
      business = @store.createRecord 'business', @get('fields')
      business.save().then ((business) ->
        _this.transitionToRoute 'business', business
      ), (errors) ->
        _this.set 'showError', true

    reset: ->
      @set 'fields', {}
      @set 'contactsArray', []

    addContact: ->
      @get('contactsArray').pushObject({})
)
