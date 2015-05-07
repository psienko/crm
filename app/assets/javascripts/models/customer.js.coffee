App.Customer = DS.Model.extend({
  customerableId: DS.attr('number')
  customerableType: DS.attr('string')
  #customerable: DS.belongsTo('customerable', {polymorphic: true})
  
  team: DS.belongsTo('team')
  person: DS.belongsTo('person')
  business: DS.belongsTo('business')
  receivedMessages: DS.hasMany('receivedMessage')
  sentMessages: DS.hasMany('sentMessage')

  

  icon: ( ->
    if @get('customerableType') == 'Person'
      return "<i class='fa fa-users fa-lg'></i>"
    if @get('customerableType') == 'Business'
      return "<i class='fa fa-bank fa-lg'></i>"
  ).property()

  type: ( ->
    @get 'customerableType'
  ).property('customerableType')

  customerable: ( ->
    if @get('customerableType') == 'Person'
      return @get('person')
    if @get('customerableType') == 'Business'
      return @get('business')
  ).property('customerableId', 'customerableType')
  
  fullName: ( ->
    if @get('customerableType') == 'Person'
      person = @get('person')
      return person.get('firstname') + ' ' + person.get('lastname')
    if @get('customerableType') == 'Business'
      return @get('business.companyName')
  ).property('customerableId', 'customerableType')
})
