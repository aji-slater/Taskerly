class Task < ApplicationRecord
  belongs_to :user

  def lists
    ListedItem.where(listable_id: id, listable_type: 'Task')
  end
end
