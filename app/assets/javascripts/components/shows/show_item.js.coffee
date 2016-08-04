@ShowItem = React.createClass
  render: ->
    React.DOM.div
      className: 'col-xs-6 col-sm-4 col-md-3 show-card-container'

      React.createElement BingeMenu, show: @props.show

      React.DOM.div
        className: 'show-card clickable'

        React.DOM.div
          className: 'inner-show-card'
          onClick: (e) =>
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
