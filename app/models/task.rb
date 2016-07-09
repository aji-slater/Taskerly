class Task < ApplicationRecord

  def lists
    ListedItem.where(listable_id: id, listable_type: 'Task')
  end
end
