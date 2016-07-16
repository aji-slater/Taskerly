@Task = React.createClass
  render: ->
    React.DOM.div
      className: 'task__slip'
      React.DOM.span
        className: 'task__slip--name'
        @props.task.name
