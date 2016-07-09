class Note < ApplicationRecord

  def lists
    ListedItem.where(listable_id: id, listable_type: 'Note')
end
