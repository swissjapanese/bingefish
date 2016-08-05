@BingeMenu = React.createClass
  stateClass: (state) ->
    if @props.status[state]
      state
    else
      'clean-button'

  handleUpdate: (type) ->
    $.ajax
      method: 'PUT'
      url: "/api/show/#{@props.showId}/status"
      data:
        binge_list:
          "#{type}": !@props.status[type]
      success: (data) =>
        @setState data
        @props.handleUpdate(type)

  render: ->
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
