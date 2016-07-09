class List < ApplicationRecord
  def tasks
    listed_tasks = ListedItem.where(list_id: id, listable_type: 'Task')
    Task.where(id: listed_tasks)
  end
end
