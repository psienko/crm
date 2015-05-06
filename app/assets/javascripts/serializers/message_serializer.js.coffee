#App.MessageSerializer = DS.RESTSerializer.extend  normalizePayload: (payload) ->
  #if Array.isArray(payload)
    #return { 'messages': payload }
  #payload