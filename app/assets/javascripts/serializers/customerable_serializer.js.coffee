#App.CustomerableSerializer = DS.RESTSerializer.extend(serializePolymorphicType: (record, json, relationship) ->
 # key = relationship.key
  #belongsTo = get(record, key)
  #key = if @keyForAttribute then @keyForAttribute(key) else key
  #json[key + '_type'] = belongsTo.constructor.typeKey
  #return
#)

