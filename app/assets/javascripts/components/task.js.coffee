@Task = React.createClass
  handleCheck: (event) ->
    # @setProps
    #   @props.task.state: !@props.task.state
    # @strikeText(event.target)
    # $.ajax
    #   url: "tasks/#{@props.task.id}"
    #   method: 'patch'
    #   data:
    #     task:
    #       id: @props.task.id
    #       state: event.target.checked
  render: ->
    React.DOM.div
      className: 'task__slip'
      React.DOM.input
        className: 'task__slip__checkbox'
        type: 'checkbox'
        defaultChecked: @props.task.state
        onChange: @handleCheck
      React.DOM.span
        className: 'task__slip--name'
        @props.task.name
      React.DOM.span
        className: 'task__slip--due-date'
        @printDueDate()
  checkForStrike: ->
    @strikeText() if @props.task.state == true
  strikeText: (e) ->
    $(e).closest('.task__slip').css "text-decoration", "line-through"
  printDueDate: ->
    'no due date' if @props.task.due_date == null
