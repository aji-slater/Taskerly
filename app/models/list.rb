class List < ApplicationRecord
  def tasks
    listed_tasks = ListedItem.where(list_id: id, listable_type: 'Task')
    Task.where(id: listed_tasks)
  end

  def notes
    listed_notes = ListedItem.where(list_id: id, listable_type: 'Note')
    Note.where(id: listed_notes)
  end

  def items
    listed_tasks = tasks
    listed_notes.merge(listed_tasks)
  end

  def add_new_task(name, due_date=nil)
    
  end
end
