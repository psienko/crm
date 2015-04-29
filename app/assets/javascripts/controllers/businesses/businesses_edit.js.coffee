App.BusinessesEditController = Ember.ObjectController.extend(
  isSaved: false
  isError: false
  allowAddContacts: true

  actions:
    save: ->
      @set 'isError', false
      @set 'isSaved', false
      _this = @
      contacts = fromHashToString(@get('contactsArray'))
      @set 'model.contacts', contacts
      @get('model').save().then ->
        _this.set 'isSaved', true
      , ->
        _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false

    addContact: ->
      @get('contactsArray').pushObject({})
)
