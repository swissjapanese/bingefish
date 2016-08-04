@SearchResultItem = React.createClass
  componentDidMount: ->
    $("#bingemenu#{@props.show.id }").hide()

  render: ->
    React.DOM.div
      className: 'col-xs-6 col-sm-4 col-md-3 show-card-container'

      # binge menu
      React.DOM.div
        id: "bingemenu#{@props.show.id }"
        className: 'binge-menu-container'
        React.DOM.div
          className: 'binge-menu-arrow'
        React.DOM.div
          className: 'binge-button-container'

          React.DOM.div
            className: 'binge-button clickable'
            React.DOM.div
              className: 'binge-button-icon'
              React.DOM.span
                className: 'glyphicon glyphicon-ok add-binge-button'
            React.DOM.div
              className: 'binge-button-label'
              'binged'

          React.DOM.div
            className: 'binge-button clickable'
            React.DOM.div
              className: 'binge-button-icon'
              React.DOM.span
                className: 'glyphicon glyphicon-plus watch-button'
            React.DOM.div
              className: 'binge-button-label'
              'watchlist'

          React.DOM.div
            className: 'binge-button clickable'
            React.DOM.div
              className: 'binge-button-icon'
              React.DOM.span
                className: 'glyphicon glyphicon-lock guilty-button'
            React.DOM.div
              className: 'binge-button-label'
              'shhhh'


      # button for binge menu
      React.DOM.div
        className: 'binge-menu-button clickable'
        React.DOM.span
          className: 'glyphicon glyphicon-plus'
          onClick: (e) =>
            $("#bingemenu#{@props.show.id }").fadeToggle()

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
