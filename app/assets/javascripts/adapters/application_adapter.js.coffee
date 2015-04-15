# Override the default adapter with the `DS.ActiveModelAdapter` which

DS.RESTAdapter.reopen
  namespace: 'api/v1'
  ajaxError: (jqXHR) ->
    error = @_super(jqXHR)

    if jqXHR and jqXHR.status is 422
      response = Ember.$.parseJSON(jqXHR.responseText)
      errors = {}
      if response.errors?
        jsonErrors = response.errors
        Ember.keys(jsonErrors).forEach (key) ->
          errors[Ember.String.camelize(key)] = jsonErrors[key]

      new DS.InvalidError(errors)
    else
      error


App.ApplicationAdapter = DS.ActiveModelAdapter.extend()


App.MyAdapter = DS.RESTAdapter.extend(findQuery: (store, type, query) ->
  url = @buildURL(type.typeKey)
  proc = 'GET'
  obj = data: query
  theFinalQuery = url + '?' + $.param(query)
  console.log url
  console.log proc
  console.log obj
  console.log theFinalQuery
  @_super store, type, query
  #return this.ajax(url, proc, obj);
)
