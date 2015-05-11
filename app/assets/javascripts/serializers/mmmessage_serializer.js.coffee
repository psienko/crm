#App.MessageSerializer = DS.RESTSerializer.extend  normalizePayload: (payload) ->
  #if Array.isArray(payload)
    #return { 'messages': payload }
  #payload

#App.MessageSerializer = DS.RESTSerializer.extend(serializeIntoHash: (hash, type, record, options) ->
 # @_super hash, type, record, options
  #Ember.merge hash, 'who': record.get('who')
  #alert()
  #return
#)  