#App.Person = DS.Model.extend(App.Customerable, { 

App.Person = App.Customerable.extend
  firstname: DS.attr('string')
  lastname: DS.attr('string')
  pesel: DS.attr('string')
  email: DS.attr('string')
  phoneNumber: DS.attr('string')
  city: DS.attr('string')
  address: DS.attr('string')
  postcode: DS.attr('string')
  dateOfBirth: DS.attr('date')

  formattedDate: ( ->
    moment(@get('dateOfBirth')).format 'DD/MM/YYYY'
  ).property('dateOfBirth')

  fullName: ( ->
    @get('firstname') + " " + @get('lastname')
  ).property('firstname', 'lastname')
#App.Person.reopenClass
 # valid: (fields) ->
  #  fields.firstname and fields.lastname
