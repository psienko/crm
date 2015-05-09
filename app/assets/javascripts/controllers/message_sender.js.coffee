App.MessageSenderController = Ember.Controller.extend(
  needs: ['application']
  isSent: false
  isError: false

  userInfo: Ember.computed.alias('controllers.application.userInfo')

  actions:
    sendReply: (message, type)->
      classId = "." + message.get('htmlId')
      editorDiv = $(classId).find('.email-box')
      body = $(classId).find('textarea').val()
      oldRecipientType = message.get 'recipientType' 
      oldRecipientId = message.get 'recipientId'
      if type == 'received'
        recipientId = message.get('senderId')
        recipientType = message.get('senderType')
        if oldRecipientType == 'Team' || oldRecipientType == 'Customer'
          senderId = @get 'userInfo.team.id'
          senderType = "Team"
        if oldRecipientType == 'Employee'
          senderId = @get 'userInfo.id'
          senderType = "Employee"
      if type == 'sent'
        recipientId = message.get('recipientId')
        recipientType = message.get('recipientType')
        senderId = message.get('senderId')
        senderType = message.get('senderType')
      if message.get('references') == null
        references = ''
      else
        references = message.get('references')
      if message.get('inReplyTo') == null
        inReplyTo = ''
      else
        inReplyTo = message.get('inReplyTo')  

      references = references.concat(inReplyTo)
      inReplyTo = message.get('messageId')
      subject = 'Re:'+message.get('subject')
      message = {"recipientId": recipientId, "recipientType": recipientType, "senderId": senderId, "senderType": senderType, "subject": subject, "body": body, "from": '', "to": '', "date": '', "messageId": '', "inReplyTo": inReplyTo, "references": references}
      _this = @

      newMessage = @store.createRecord 'message' , message
      newMessage.save().then ((person) ->
        editorDiv.addClass('hide')
        editorDiv.next('.send-panel').addClass('hide')
        editorDiv.empty()
        editorDiv.prev('.success-info').removeClass('hide')
        alert = editorDiv.parent().parent().prev().find('.success-info')
        alert.removeClass('hide')
        setTimeout (->
          alert.addClass('hide')
        ), 3000
      ), (errors) ->
        alert = editorDiv.parent().parent().prev().find('.error-info')
        alert.removeClass('hide')
        setTimeout (->
          alert.addClass('hide')
        ), 3500
)
