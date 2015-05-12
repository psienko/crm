App.MessageModalController = Ember.Controller.extend(
  needs: ['application']
  userInfo: Ember.computed.alias('controllers.application.userInfo')
  userInfoId: Ember.computed.alias('controllers.application.userInfo.id')
  #sentMessage: null
  
  init: ->
    @_super()
    @set 'sentMessage', null
    return

  actions:  
    send: ->
      modelType = @get 'model.type'
      modelId = @get 'model.id'
      if modelType == 'Person' || modelType == 'Business'
        senderId = @get 'userInfo.team.id'
        senderType = 'Team'
        modelType = 'Customer'
      else
        senderId = @get 'userInfo.id'
        senderType = 'Employee'
      subject = $('input#messageSubject').val()
      body = $('textarea#messageBodyModal').val()
      message = {"recipientId": modelId, "recipientType": modelType, "senderId": senderId, "senderType": senderType, "subject": subject, "body": body}
      _this = @
      newMessage = @store.createRecord 'sentMessage' , message
      newMessage.save().then ( ->
        $('input#messageSubject').val('')
        $(".wysihtml5-sandbox").data("wysihtml5").editor.setValue('')
        #_this.set 'sentMessage', newMessage
        alertInfo = $('.success-info')
        alertInfo.removeClass('hide')
        setTimeout (->
          alertInfo.addClass('hide')
        ), 3000
      ), (errors) ->
        alertInfo = $('.error-info')
        alertInfo.removeClass('hide')
        setTimeout (->
          alertIndo.addClass('hide')
        ), 3500       
)
