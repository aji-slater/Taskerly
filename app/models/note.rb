class Note < ApplicationRecord
  belongs_to :user

  def lists
    ListedItem.where(listable_id: id, listable_type: 'Note')
  end
end
