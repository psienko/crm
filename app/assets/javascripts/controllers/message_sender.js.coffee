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
        newMessage.set 'recipientId', message.get('senderId')
        newMessage.set 'recipientType', message.get('senderType')
        if message.get('recipientType') == 'Team' || message.get('recipientType') == 'Customer'
          newMessage.set 'senderId', @get 'userInfo.team.id'
          newMessage.set 'senderType', "Team"
        if message.get('recipient.type') == 'Employee'
          newMessage.set 'senderId', @get 'userInfo.id'
          newMessage.set 'senderType', "Employee"
      newMessage.set 'body', body
      if message.get('references') == null
        references = ''
      else
        references = message.get('references')

      if message.get('inReplyTo') == null
        inReplyTo = ''
      else
        inReplyTo = message.get('inReplyTo')  

      newMessage.set 'references', references.concat(inReplyTo)
      newMessage.set 'inReplyTo', message.get('messageId')
      newMessage.set('subject', 'Re:'+message.get('subject'))
      message = {"recipientId": newMessage.get('recipientId'), "recipientType": newMessage.get('recipientType'), "senderId": newMessage.get('senderId'), "senderType": newMessage.get('senderType'), "subject": newMessage.get('subject'), "body": newMessage.get('body'), "from": '', "to": '', "date": '', "messageId": newMessage.get('messageId'), "inReplyTo": newMessage.get('inReplyTo'), "references": newMessage.get('references')}
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
