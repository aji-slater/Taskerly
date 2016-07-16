@Tasks = React.createClass
  getInitialState: ->
    tasks: @props.data
  getDefaultProps: ->
    tasks: []
  render: ->
    React.DOM.div
      className: 'task__header'
      React.DOM.h1
        className: 'task__header--text'
        'Tasks'
      React.DOM.div
        classname: 'task__content--task-wrapper'
        for task in @state.tasks
          React.createElement Task, key: task.id, task: task
