App.BusinessesEditController = Ember.ObjectController.extend(
  isSaved: false
  isError: false
  actions:
    save: ->
      @set 'isError', false
      @set 'isSaved', false
      _this = @
      @get('model').save().then ->
        _this.set 'isSaved', true
      , ->
        _this.set 'isError', true

    closeErrorAlert: ->
      @set 'isError', false

    closeSuccessAlert: ->
      @set 'isSaved', false
)
