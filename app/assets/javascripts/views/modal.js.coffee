App.ModalView = Em.View.extend(
  layout: Em.Handlebars.compile('{yield}<div class=modal-backdrop></div>')
  didInsertElement: ->
    App.animateModalOpen()
    return
)