@SearchResults = React.createClass
  getInitialState: ->
    shows: @props.data
  getDefaultProps: ->
    shows: []
  render: ->
    React.DOM.div
      className: 'search-results container-fluid'
      React.DOM.div
        className: 'row'
        for show in @state.shows
          React.createElement SearchResultItem, key: show.tvdb_id, show: show
