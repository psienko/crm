App.Router.reopen
  location: 'auto'
  rootURL: '/'

App.Router.map ->
  @resource 'customers', path: '/customers', ->
    @resource 'businesses', path: '/businesses'
    @resource 'people', path: '/people', ->
      @resource 'person', path: '/:id'
      @route 'new'
      @route 'search'