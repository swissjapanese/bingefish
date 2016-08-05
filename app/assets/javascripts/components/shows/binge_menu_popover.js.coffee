@BingeMenuPopover = React.createClass
  getInitialState: ->
    status: []

  componentDidMount: ->
    $("#bingemenu#{ @props.showId }").hide()
    $.ajax
      method: 'GET'
      url: "/api/show/#{@props.showId}/status"
      success: (data) =>
        @setState 'status': data

  handleUpdate: (type) ->
    status = @state.status
    status[type] = !@state.status[type]
    @setState "status": status

  menuButtonClass: ->
    if @state.status.binge || @state.status.watchlist
      'green-menu-button'
    else
      'red-menu-button'

  bingeMenuButtonClass: ->
    if @state.status.binge
      'glyphicon-ok'
    else if @state.status.watchlist
      'glyphicon-question-sign'
    else
      'glyphicon-plus'

  render: ->
    React.DOM.div
      className: 'binge-menu-popover-container'
      React.DOM.div
        className: "binge-menu-button clickable #{@menuButtonClass()}"
        React.DOM.span
          className: "glyphicon #{@bingeMenuButtonClass()}"
          onClick: (e) =>
            $("#bingemenu#{@props.showId }").fadeToggle()
      React.DOM.div
        id: "bingemenu#{@props.showId }"
        className: 'binge-menu-container'
        React.DOM.div
          className: 'binge-menu-arrow'
        React.createElement(
            BingeMenu,
            showId: @props.showId,
            status: @state.status,
            handleUpdate: @handleUpdate
          )
