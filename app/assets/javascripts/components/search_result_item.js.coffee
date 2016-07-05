@SearchResultItem = React.createClass
  render: ->
    React.DOM.div
      className: 'col-xs-3 show-card-container'
      React.DOM.div
        className: 'show-card'
        React.DOM.img
          src: @props.show.poster
          className: 'show-poster'
        React.DOM.div
          className: 'show-title'
          @props.show.series_name
