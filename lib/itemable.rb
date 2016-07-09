# module for list-like behavior
# allows for--
# 1. adding items to a list
# 2. adding NEW items to a list
# 3. reordering items on a list
# 4. retrieving items from a list
module Itemable
  def add_new_item(klass, properties_hash)
    item = klass.create!(properties_hash)
    ListedItem.create!(
                       list_id: id,
                       listable_id: item.id,
                       listable_type: item.class.name,
                       position: current_length,
                      )
    item
  end

  def add_item(item)
    ListedItem.create!(
                       listable_id: item.id,
                       listable_type: item.class.name,
                       list_id: id,
                       position: current_length
                      )
    true
  end

  def items_of_type(klass)
    listed_items = ListedItem.select(:listable_id).where(list_id: id, listable_type: klass.to_s)
    klass.where(id: listed_items)
  end

  def current_length
    ListedItem.where(list_id: id).count
  end
end
