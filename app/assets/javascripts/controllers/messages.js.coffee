App.MessagesController = Ember.ObjectController.extend(
  needs: ['application', 'messageSender']

  isShowedSent: false
  isShowedReceived: true
  isShowedCreate: false
  isReceiving: false
  isLoadingReceived: false
  isLoadingSent: false

  userInfo: Ember.computed.alias('controllers.application.userInfo')

  displaiedMessages: ( ->
    if @get 'isShowedReceived' 
      return @get 'inboundMessages'
    if @get 'isShowedSent'
      return @get 'outboundMessages' 
  ).property('isShowedSent', 'isShowedSent')

  messagesTypeDidChanged: (->
    if @get 'isShowedSent'
     @set 'displaiedMessages', @get 'outboundMessages'
    if @get 'isShowedReceived'
     @set 'displaiedMessages', @get 'inboundMessages'
  ).observes('isShowedSent', 'isShowedReceived')

  messagesDidChanged: (->
    if @get 'isShowedReceived'
      @set 'displaiedMessages', @get 'inboundMessages'
      return
    if @get 'isShowedSent'  
      @set 'displaiedMessages', @get 'outboundMessages'
  ).observes('outboundMessages', 'inboundMessages')

  actions:
    receive: ->
      @set 'isReceiving', true
      @set 'isShowedSent', false
      @set 'isShowedReceived', true
      @set 'isShowedCreate', false
      $( "#sentMessages" ).removeClass( "active" )
      $( "#receivedMessages" ).addClass( "active" )
      $( "#createMessage" ).removeClass( "active" )
      _this = @
      (messages = @store.find('receivedMessage', {received_by: 'Employee'})).finally ->
        _this.set 'inboundMessages', messages
        setTimeout (-> _this.set 'isReceiving', false), 500 

    showhide: (htmlId)->
      htmlClass = "."+htmlId
      messageDiv = $(htmlClass)
      if messageDiv.hasClass('hide')
        messageDiv.removeClass('hide')
      else
        messageDiv.addClass('hide')

    goto: (sender) ->
      if sender.get('type') == 'Business'
        @transitionToRoute("business", sender.get('customerable'))
        return
      if sender.get('type') == 'Person'
        @transitionToRoute("person", sender.get('customerable'))
        return
      if sender.get('type') == 'Employee'
        @get('controllers.application').send('showModal', 'employees.show', sender)

    showReplyEditor: (message) -> 
      htmlClass = "."+message.get('htmlId')
      editorDiv = $(htmlClass).find('.email-box')
      if editorDiv.hasClass('hide')
        editorDiv.removeClass('hide')
        editorDiv.next('.send-panel').removeClass('hide')
        editorDiv.append("<textarea class='wysihtml5 wysihtml5-sandbox full-row' placeholder='Wprowadź wiadomość ...'></textarea>")
        wysihtml = editorDiv.find('.wysihtml5')
        wysihtml.wysihtml5()
      else
        editorDiv.addClass('hide')
        editorDiv.next('.send-panel').addClass('hide')
        editorDiv.empty()

    showReceived: ->
      @set 'isLoadingReceived', true
      @set 'isShowedSent', false
      @set 'isShowedReceived', true
      @set 'isShowedCreate', false
      $( "#sentMessages" ).removeClass( "active" )
      $( "#receivedMessages" ).addClass( "active" )
      $( "#createMessage" ).removeClass( "active" )
      _this = @
      (messages = @store.find('receivedMessage', {received_by: 'Employee'})).finally ->
        _this.set 'inboundMessages', messages
        setTimeout (-> _this.set 'isLoadingReceived', false), 500

    showSent: ->
      @set 'isLoadingSent', true
      @set 'isShowedSent', true
      @set 'isShowedReceived', false
      @set 'isShowedCreate', false
      $( "#sentMessages" ).addClass( "active" )
      $( "#receivedMessages" ).removeClass( "active" )
      $( "#createMessage" ).removeClass( "active" )
      _this = @
      (messages = @store.find('sentMessage', {sent_by: 'Employee'})).finally ->
        _this.set 'outboundMessages', messages
        setTimeout (-> _this.set 'isLoadingSent', false), 500

    showCreate: ->
      @set 'isShowedCreate', true
      @set 'isShowedSent', false
      @set 'isShowedReceived', false
      $( "#sentMessages" ).removeClass( "active" )
      $( "#receivedMessages" ).removeClass( "active" )
      $( "#createMessage" ).addClass( "active" )

    send: ->
      toInput = $('#newEmailEditor').find('#messageTo')
      toInputValidation = $('#newEmailEditor').find('.warning-info')
      if toInput.val().length == 0
        toInputValidation.removeClass('hide')
        return
      unless toInputValidation.hasClass('hide')
        toInputValidation.addClass('hide')
      @set 'fields.to', $('#newEmailEditor').find('#messageTo').val()
      @set 'fields.subject', $('#newEmailEditor').find('#messageSubject').val()
      @set 'fields.body', $('#newEmailEditor').find('#newEmailTextarea').val()
      _this = @
      newMessage = @store.createRecord 'message' , @get('fields')
      newMessage.save().then ( ->
        $('#newEmailEditor').find('#messageTo').val('')
        $('#newEmailEditor').find('#messageSubject').val('')
        $('#newEmailEditor').find(".wysihtml5-sandbox").data("wysihtml5").editor.setValue('')
        alertInfo = $('#newEmailEditor').find('.success-info')
        alertInfo.removeClass('hide')
        setTimeout (->
          alertInfo.addClass('hide')
        ), 3000
      ), (errors) ->
        alertInfo = $('#newEmailEditor').find('.error-info')
        alertInfo.removeClass('hide')
        setTimeout (->
          alertInfo.addClass('hide')
        ), 3500       
)