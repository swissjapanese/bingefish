@ShowPage = React.createClass
  render: ->
    React.DOM.div
      className: 'show-page-container container'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-sm-9'
          React.DOM.div
            className: 'show-comments-container'
            'Hello main menu'

        React.DOM.div
          className: 'col-sm-3'
          React.DOM.div
            className: 'show-sidebar-container'
            React.createElement(
                ShowSidebar,
                showId: @props.show.id
              )
