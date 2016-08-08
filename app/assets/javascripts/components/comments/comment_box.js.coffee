@CommentBox = React.createClass
  render: ->
    React.DOM.div
      className: 'show-comments-container'
      React.DOM.input
        type: 'text'
        className: 'comment-form'
        placeholder: 'What have you been binging?'
      React.DOM.div
        className: ''
