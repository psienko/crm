@fromHashToString = (hashTable) ->
  outputString = JSON.stringify(hashTable)
  outputString = outputString.replace(/":"/g, '=>"')
  outputString = outputString.replace(/"name/g, ':name')
  outputString = outputString.replace(/"lastname/g, ' :lastname')
  outputString = outputString.replace(/"position/g, ' :position')
  outputString = outputString.replace(/"email/g, ' :email')
  outputString

@HashTable = (obj) ->
  length = 0
  items = {}
  for p of obj
    if obj.hasOwnProperty(p)
      items[p] = obj[p]
      length++
  items