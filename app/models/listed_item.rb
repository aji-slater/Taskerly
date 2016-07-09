class ListedItem < ApplicationRecord
  def list
    List.find(list_id)
  end

  def listed_item
    case listable_type
    when 'Task'
      Task.find(listable_id)
    when 'Note'
      Note.find(listable_id)
      # else
      # TODO: Raise an exception if no listed_item
    end
  end
end
