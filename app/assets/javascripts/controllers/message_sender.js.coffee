App.MessageSenderController = Ember.Controller.extend(
  needs: ['application']
  isCreated: false

  userInfo: Ember.computed.alias('controllers.application.userInfo')

  actions:
    sendReply: (message, type)->
      classId = "." + message.get('htmlId')
      body = $(classId).find('textarea').val()
      newMessage = message
      if type == 'received'
        newMessage.set 'recipient', message.get('sender')
      newMessage.set 'body', body
      if message.get('recipient.type') == 'Team'
        who = 'Team'
      if message.get('recipient.type') == 'Employee'
        who = 'Employee'
      if message.get('recipient.type') == 'Person' || message.get('recipient.type') == 'Business'
        who = 'Customer'
      delete newMessage.id
      newMessage.set 'sender', ''
      subject = 'Re:'+message.get('subject')
      newMessage.set('subject', subject)
      message = {"recipientId": newMessage.get('recipientId'), "recipientType": newMessage.get('recipientType'), "senderId": newMessage.get('senderId'), "senderType": newMessage.get('senderType'), "subject": newMessage.get('subject'), "body": newMessage.get('body'), "from": newMessage.get('from'), "to": newMessage.get('to'), "date": '', "messageId": newMessage.get('messageId'), "inReplyTo": newMessage.get('inReplyTo'), "references": newMessage.get('references')}
      _this = @
      message = @store.createRecord 'message' , message
      message.save().then ((person) ->
       alert('ok')
      ), (errors) ->
        alert('error')
       # _this.set 'showError', true

    reset: ->
      @set 'fields', {}
)
