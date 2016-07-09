require 'itemable'

class List < ApplicationRecord
  # include Taskable
  # include Notable
  include Itemable
  belongs_to :user

  def notes
    listed_notes = ListedItem.where(list_id: id, listable_type: 'Note')
    Note.where(id: listed_notes.listable_id)
  end

  def items
    binding.pry
    notes.merge(tasks)
  end
end
