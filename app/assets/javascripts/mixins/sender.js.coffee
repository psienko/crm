App.Sender = Ember.Mixin.create({
 senderId:  DS.attr('number')
 senderType: DS.attr('string')

 sender: ( ->
    if @get('senderType') == 'Customer'
      return  @store.find('customer', @get 'senderId')
    if @get('senderType') == 'Team'
      return @store.find('team', @get 'senderId')
    if @get('senderType') == 'Employee'
      return @store.find('employee', @get 'senderId')
  ).property('senderId', 'senderType')
})
