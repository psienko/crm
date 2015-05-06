App.Employee =  DS.Model.extend( {
  firstname: DS.attr('string')
  lastname: DS.attr('string')
  email: DS.attr('string')
  avatar: DS.attr('string')
  lastSignInAt: DS.attr('date')
  currentSignInAt: DS.attr('date')
  avatarThumb: DS.attr('string')

  team: DS.belongsTo('team')
  receivedMessages: DS.hasMany('receivedMessage')
  sentMessages: DS.hasMany('sentMessage')

  icon: DS.attr('type', {defaultValue: "<i class='fa fa-envelope fa-lg'></i>"})

  fullName: ( ->
    @get('firstname') + ' ' + @get('lastname') 
  ).property('firstname', 'lastname')
})
