@SearchResultItem = React.createClass
  render: ->
    React.DOM.div
      className: 'col-xs-6 col-sm-4 col-md-3 show-card-container'
      React.DOM.div
        className: 'show-card clickable'
        onClick: =>
          window.location = "/shows/#{@props.show.id}"
        React.DOM.img
          src: @props.show.fanart
          className: 'show-fanart'
        React.DOM.div
          className: 'show-info'
          React.DOM.div
            className: 'show-title'
            @props.show.series_name
          React.DOM.div
            className: 'show-overview'
            @props.show.overview
