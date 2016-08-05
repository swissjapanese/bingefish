@ShowSidebar = React.createClass
  getInitialState: ->
    status: []

  componentDidMount: ->
    $.ajax
      method: 'GET'
      url: "/api/show/#{@props.showId}/status"
      success: (data) =>
        @setState 'status': data

  render: ->
    React.DOM.div
      className: 'show-sidebar-container'
      React.createElement(
          BingeMenu,
          show: @props.show,
          status: @state.status
        )
