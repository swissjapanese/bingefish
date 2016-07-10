@SearchResultItem = React.createClass
  mouseOver: ->
    $('.show-overview').show()

  mouseOut: ->
    $('.show-overview').hide()

  render: ->
    React.DOM.div
      className: 'col-xs-6 col-sm-4 col-md-3 show-card-container'
      React.DOM.div
        onMouseOver: @mouseOver
        onMouseOut: @mouseOut
        className: 'show-card'
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
