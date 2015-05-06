#App.ReceivedMessage = Ember.Mixin.create({
  #recipientId: DS.attr('string')
  #recipientType: DS.attr('string')
  #recipient: DS.belongsTo('recipient', {polymorphic: true})
#})
