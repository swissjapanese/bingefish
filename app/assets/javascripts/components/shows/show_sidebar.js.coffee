@ShowSidebar = React.createClass
  getInitialState: ->
    status: []

  componentDidMount: ->
    $.ajax
      method: 'GET'
      url: "/api/show/#{@props.showId}/status"
      success: (data) =>
        @setState 'status': data

  handleStatusUpdate: (type) ->
    status = @state.status
    status[type] = !@state.status[type]
    @setState "status": status

  render: ->
    React.DOM.div
      className: 'binge-menu-sidebar-container'
      React.createElement(
          BingeMenu,
          showId: @props.showId,
          status: @state.status
          handleUpdate: @handleStatusUpdate
        )
