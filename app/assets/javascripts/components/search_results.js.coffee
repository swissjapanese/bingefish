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
      $('.main-container').show()
      @setState shows: []


  loadSearchResults: (value) ->
    $.ajax
      url: 'api/v1/search'
      method: 'GET'
      data:
        query: $('#nav-search').val()
      error: (error, status, statusText) ->
        alert('server problem :(')
      success: (data, status, jqhxr) =>
        $('.search-result-container').show()
        $('.main-container').hide()
        $('#navbar-search .search-close').show()
        @setState shows: data

  render: ->
    React.DOM.div
      className: 'search-results container-fluid'
      React.DOM.div
        className: 'row'
        for show in @state.shows
          React.createElement SearchResultItem, key: show.tvdb_id, show: show
