@BingeMenu = React.createClass
  getInitialState: ->
    binge: false,
    updated: false,
    watchlist: false,
    guilty: false

  componentDidMount: ->
    $("#bingemenu#{ @props.show.id }").hide()
    $.ajax
      method: 'GET'
      url: "/api/show/#{@props.show.id}/status"
      success: (data) =>
        @setState data

  handleUpdate: (type) ->
    $.ajax
      method: 'PUT'
      url: "/api/show/#{@props.show.id}/status"
      data:
        binge_list:
          "#{type}": !@state[type]
      success: (data) =>
        @setState data

    @setState "#{type}": !@state[type]

  menuButtonClass: ->
    if @state.binge || @state.updated
      'green-menu-button'
    else
      'red-menu-button'

  stateClass: (state) ->
    if @state[state]
      state
    else
      'clean-button'

  bingeMenuButtonClass: ->
    if @state.updated
      'glyphicon-ok'
    else if @state.binge
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

      React.DOM.div
        id: "bingemenu#{@props.show.id }"
        className: 'binge-menu-container'
        React.DOM.div
          className: 'binge-menu-arrow'
        React.DOM.div
          className: 'binge-button-container'

          React.DOM.div
            className: "binge-button clickable #{@stateClass 'binge'}"
            onClick: =>
              @handleUpdate('binge')
            React.DOM.div
              className: 'binge-button-icon'
              React.DOM.span
                className: 'glyphicon glyphicon-ok add-binge-button'
            React.DOM.div
              className: 'binge-button-label'
              'binged'

          React.DOM.div
            className: "binge-button clickable #{@stateClass 'watchlist'}"
            onClick: =>
              @handleUpdate('watchlist')
            React.DOM.div
              className: 'binge-button-icon'
              React.DOM.span
                className: 'glyphicon glyphicon-plus watch-button'
            React.DOM.div
              className: 'binge-button-label'
              'watchlist'

          React.DOM.div
            className: "binge-button clickable #{@stateClass 'guilty'}"
            onClick: =>
              @handleUpdate('guilty')
            React.DOM.div
              className: 'binge-button-icon'
              React.DOM.span
                className: 'glyphicon glyphicon-lock guilty-button'
            React.DOM.div
              className: 'binge-button-label'
              'shhhh'