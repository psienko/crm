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

  contactsArray: DS.attr()
