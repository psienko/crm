App.CustomRESTSerializer = DS.RESTSerializer.extend(extractMeta: (loader, type, json) ->
  meta = undefined
  meta = json[@configOption(type, 'meta')]
  if !meta
    return
  Ember.set 'App.metaData', meta
  @_super loader, type, json
  return
)