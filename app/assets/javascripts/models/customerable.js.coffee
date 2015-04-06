App.Customerable = DS.Model.extend({
  #customer: DS.belongsTo('customer')

  customerableType: ( ->
    @constructor.typeKey
    return
  ).property()

});
