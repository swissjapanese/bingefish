@BingeMenuPopover = React.createClass
  getInitialState: ->
    status: []

  componentDidMount: ->
    $("#bingemenu#{ @props.show.id }").hide()
    $.ajax
      method: 'GET'
      url: "/api/show/#{@props.show.id}/status"
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
      className: ''
      React.DOM.div
        className: "binge-menu-button clickable #{@menuButtonClass()}"
        React.DOM.span
          className: "glyphicon #{@bingeMenuButtonClass()}"
          onClick: (e) =>
            $("#bingemenu#{@props.show.id }").fadeToggle()
      React.createElement(
          BingeMenu,
          show: @props.show,
          status: @state.status,
          handleUpdate: @handleUpdate
        )
