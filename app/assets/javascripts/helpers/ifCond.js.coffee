Handlebars.registerHelper 'ifCond', (v1, v2, options) ->
  if v1 == v2
    return options.fn(this)
  options.inverse this

Handlebars.registerHelper 'unlessCond', (v1, v2, options) ->
  unless v1 == v2
    return options.fn(this)
  options.inverse this