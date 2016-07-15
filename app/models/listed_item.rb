class ListedItem < ApplicationRecord
  belongs_to :listable, polymorphic: true
  belongs_to :list

  acts_as_list scope: :list

  def name
    listable.name
  end

  def i
    listable
  end

  def siblings
    list.listed_items.order(:position)
  end
end
