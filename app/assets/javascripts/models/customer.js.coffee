App.Customer = DS.Model.extend({
  customerableId: DS.attr('number')
  customerableType: DS.attr('string'),
  #customerable: DS.belongsTo('customerable', {polymorphic: true})
  
  team: DS.belongsTo('team')
  person: DS.belongsTo('person')
  business: DS.belongsTo('business')

  customerable: ( ->
    if @get('customerableType') == 'Person'
      return @get('person')
    if @get('customerableType') == 'Business'
      return @get('business')
  ).property('customerableId', 'customerableType')
  
})
