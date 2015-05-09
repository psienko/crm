App.MyTeamController = Ember.ObjectController.extend(
  needs: ['application', 'teams', 'teamsEdit', 'messageSender']
  isShowedPeople: true
  isShowedBusinesses: false

  userInfo: Ember.computed.alias('controllers.application.userInfo')
  myTeam: Ember.computed.alias('controllers.application.userInfo.team')

  init: ->
    @set 'controllers.application.userInfo', @store.find('employee', window.currentEmployeeId)
    return

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
)
