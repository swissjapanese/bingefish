@ShowPage = React.createClass
  render: ->
    React.DOM.div
      className: 'show-page-container'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-8'
          React.DOM.div
            className: 'show-comments-container'
            'Hello main menu'

        React.DOM.div
          className: 'col-md-4'
          React.DOM.div
            className: 'show-sidebar-container'
            React.createElement(
                ShowSidebar,
                showId: @props.data.ids.id
              )
