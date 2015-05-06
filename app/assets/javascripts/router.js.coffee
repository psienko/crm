App.Router.reopen
  location: 'auto'
  rootURL: '/'

App.Router.map ->
  @resource 'myTeam', path: '/'
  @resource 'customers', path: '/customers', ->
    @resource 'businesses', path: '/businesses', ->
      @resource 'business', path: '/:id'
      @route 'new'
      @route 'search'
    @resource 'people', path: '/people', ->
      @resource 'person', path: '/:id'
      @route 'new'
      @route 'search'
  @resource 'employees', path: '/employees'
  @resource 'teams', path: '/teams'
  @resource 'messages', path: '/messages'
