App.MyTeamController = Ember.ObjectController.extend(
  needs: ['application', 'teams', 'teamsEdit', 'messageSender']
  init: ->
    @set 'controllers.application.userInfo', @store.find('employee', window.currentEmployeeId)
    return

  isShowedPeople: true
  isShowedBusinesses: false
  isShowedSent: false
  isShowedReceived: true

  userInfo: Ember.computed.alias('controllers.application.userInfo')
  myTeam: (-> @get 'team').property() 

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

  myTeamDidChanged: ( ->
    if @get('userInfo.team.content.id') != @get('myTeam.id')
      @set 'myTeam', @get('userInfo.team.content')
      @set 'displaiedMessages', @get('userInfo.team.content.receivedMessages.content') if @get 'isShowedReceived'
      @set 'displaiedMessages', @get('userInfo.team.content.sentMessages.content') if @get 'isShowedSent'
      @set 'inboundMessages', @get('userInfo.team.content.receivedMessages.content') 
      @set 'outboundMessages', @get('userInfo.team.content.sentMessages.content')
  ).observes('controllers.application.userInfo.team.content')
 
  actions:
    receive: ->
      @set 'inboundMessages', @store.find('receivedMessage', {received_by: 'Team'})
      
    
    showPeople: ->
      @set 'isShowedPeople', true
      @set 'isShowedBusinesses', false
      $( "#peopleTab" ).addClass( "active" )
      $( "#businessesTab" ).removeClass( "active" )

    showBusinesses: ->
      @set 'isShowedPeople', false
      @set 'isShowedBusinesses', true
      $( "#peopleTab" ).removeClass( "active" )
      $( "#businessesTab" ).addClass( "active" )

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
      @set 'isShowedSent', false
      @set 'isShowedReceived', true
      @set 'inboundMessages', @store.find('receivedMessage', {received_by: 'Team'})
      $( "#sentMessages" ).removeClass( "active" )
      $( "#receivedMessages" ).addClass( "active" )

    showSent: ->
      @set 'isShowedSent', true
      @set 'isShowedReceived', false
      @set 'outboundMessages', @store.find('sentMessage', {sent_by: 'Team'})
      $( "#sentMessages" ).addClass( "active" )
      $( "#receivedMessages" ).removeClass( "active" )
)