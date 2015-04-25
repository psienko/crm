#App.Business =  DS.Model.extend(App.Customerable, { 
App.Business = App.Customerable.extend
  companyName: DS.attr('string')
  industry: DS.attr('string')
  email: DS.attr('string')
  phoneNumber: DS.attr('string')
  city: DS.attr('string')
  address: DS.attr('string')
  postcode: DS.attr('string')
  krs: DS.attr('string')
  nip: DS.attr('string')
  regon: DS.attr('string')
  contacts: DS.attr('string')

  contactsArray: ( ->
    input = @get 'contacts'
    outputTable = []
    hashTable = {}
    end_pos = 0
    while end_pos != input.lastIndexOf('}')
      start_pos = input.indexOf('{', end_pos) + 1
      end_pos = input.indexOf('}', start_pos)
      token = input.substring(start_pos, end_pos)
      tokens = token.split(',')
      i = 0
      while i < tokens.length
        keyValuePair = tokens[i].split('=>')
        key = keyValuePair[0].replace(':','').replace(' ','')
        value = keyValuePair[1].replace(/"/gi, '')
        hashTable[key] = value
        i++
      outputTable.push hashTable
      hashTable = {}
    outputTable
  ).property('contacts')

