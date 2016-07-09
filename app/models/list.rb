require 'record_machine/taskable'

class List < ApplicationRecord
  include Taskable
  belongs_to :user

  def notes
    listed_notes = ListedItem.where(list_id: id, listable_type: 'Note')
    Note.where(id: listed_notes)
  end

  def items
    listed_tasks = tasks
    listed_notes.merge(listed_tasks)
  end
end
