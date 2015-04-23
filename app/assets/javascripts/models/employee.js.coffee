App.Employee =  DS.Model.extend
  firstname: DS.attr('string', {defaultValue: "Jan"})
  lastname: DS.attr('string')
  email: DS.attr('string')
  avatar: DS.attr('string')
  lastSignInAt: DS.attr('date')
  currentSignInAt: DS.attr('date')
  avatarThumb: DS.attr('string')
  team: DS.belongsTo('team')
