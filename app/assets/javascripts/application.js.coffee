#= require jquery
#= require jquery_ujs
#=require bootstrap-sprockets
#= require handlebars
#= require ember
#= require ember-data
#= require bootstrap-datepicker
#= require moment
#= require_self
#= require app


# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create(
  rootElement: '#ember-app'
  currentPath: ''
)

$('.dropdown-toggle').dropdown()
