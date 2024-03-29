@SearchResults = React.createClass
  getInitialState: ->
    shows: @props.data

  getDefaultProps: ->
    shows: []

  componentDidMount: ->
    $('#nav-search').typeWatch
      callback: @loadSearchResults
      wait: 500
      highlight: true
      allowSubmit: false
      captureLength: 2

    $('#navbar-search .search-close').on 'click', =>
      $('.search-result-container').hide()
      $('.page-container').fadeIn('slow')
      @setState shows: []


  loadSearchResults: (value) ->
    $.ajax
      url: '/api/search'
      method: 'GET'
      data:
        query: $('#nav-search').val()
      error: (error, status, statusText) ->
        alert('server problem :(')
      success: (data, status, jqhxr) =>
        $('.page-container').hide()
        $('.search-result-container').hide()
        $('.search-result-container').fadeIn('slow')
        $('#navbar-search .search-close').show()
        @setState shows: data

  render: ->
    React.DOM.div
      className: 'search-results container-fluid'
      React.DOM.div
        className: 'row'
        for show in @state.shows
          React.createElement ShowItem, key: show.id, show: show
