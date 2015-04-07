App.WidgetsModalController = Em.ObjectController.extend(
  edit: (record) ->
    record.on 'didUpdate', this, ->
      @send 'closeModal'
      return
    @set 'model', record
    return
  save: ->
    @get('model.transaction').commit()
    return
)