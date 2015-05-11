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
  myTeam: Ember.computed.alias('controllers.application.userInfo.team')

  displaiedMessages: ( ->
    @get 'myTeam.receivedMessages'
  ).property('myTeam')

  messagesTypeDidChanged: (->
    if @get 'isShowedSent'
     @set 'displaiedMessages', @get 'myTeam.sentMessages'
    if @get 'isShowedReceived'
     @set 'displaiedMessages', @get 'myTeam.receivedMessages'
    ).observes('isShowedSent', 'isShowedReceived')

  actions:
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
      $( "#sentMessages" ).removeClass( "active" )
      $( "#receivedMessages" ).addClass( "active" )

    showSent: ->
      @set 'isShowedSent', true
      @set 'isShowedReceived', false
      $( "#sentMessages" ).addClass( "active" )
      $( "#receivedMessages" ).removeClass( "active" )
)