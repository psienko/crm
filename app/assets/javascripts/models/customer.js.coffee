App.Customer = DS.Model.extend({
  customerableId: DS.attr('number')
  customerableType: DS.attr('string'),
  customerable: DS.belongsTo('customerable', {polymorphic: true})
  
  #customerable: DS.belongsTo('customerable')
  #customerable: DS.belongsTo('customerable', { polymorphic: true })
  #person: DS.belongsTo('person')
});
