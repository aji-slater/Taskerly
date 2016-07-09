# module for those objects that can recieve a task
module Taskable
  def add_new_task(name, due = nil)
    task = Task.create!(name: name, due_date: due)
    ListedItem.create!(
      listable_id: task.id,
      listable_type: 'Task',
      list_id: id,
      # TODO make live user
      user_id: 1
    )
    task
  end

  def add_task(task_id)
    task = Task.find(task_id)
    ListedItem.create!(
      listable_id: task.id,
      listable_type: 'Task',
      list_id: id
    )
    true
  end

  def tasks
    listed_tasks = ListedItem.where(list_id: id, listable_type: 'Task')
    Task.where(id: listed_tasks)
  end
end
