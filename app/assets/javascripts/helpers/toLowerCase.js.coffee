Handlebars.registerHelper 'toLowerCase', (string) ->
  if string
    return string.toLowerCase
  else
    return ''
