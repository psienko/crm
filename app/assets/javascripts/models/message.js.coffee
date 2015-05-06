App.Message = DS.Model.extend({
  recipientId: DS.attr('number')
  recipientType: DS.attr('string')
  senderId: DS.attr('number')
  senderType: DS.attr('string')
  subject: DS.attr('string')
  body: DS.attr('string')
  from: DS.attr('string')
  to: DS.attr('string')
  date: DS.attr('date')
  messageId: DS.attr('string')
  inReplyTo: DS.attr('string')
  References: DS.attr('string')

  formattedDate: ( ->
    moment(@get('date')).format 'DD/MM/YYYY hh:mm'
  ).property('date')

  recipient: ( ->
    if @get('recipientType') == 'Team'
      return @store.find('team', @get('recipientId'))
    if @get('recipientType') == 'Employee'
      return @store.find('employee', @get('recipientId'))
    if @get('recipientType') == 'Customer'
      return @store.find('customer', @get('recipientId'))
  ).property('recipientId', 'recipientType')

  sender: ( ->
    if @get('senderType') == 'Team'
      return @store.find('team', @get('senderId'))
    if @get('senderType') == 'Employee'
      return @store.find('employee', @get('senderId'))
    if @get('senderType') == 'Customer'
      return @store.find('customer', @get('senderId'))
  ).property('senderId', 'senderType')
})
