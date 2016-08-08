@ShowPage = React.createClass
  render: ->
    React.DOM.div
      className: 'show-page-container'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-sm-8 col-lg-7 col-lg-offset-1'
          React.createElement CommentBox

        React.DOM.div
          className: 'col-sm-4 col-lg-3'
          React.DOM.div
            className: 'show-sidebar-container'
            React.createElement(
                ShowSidebar,
                showId: @props.data.ids.id
              )
