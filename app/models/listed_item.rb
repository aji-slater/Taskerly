class ListedItem < ApplicationRecord
  belongs_to :listable, polymorphic: true
  belongs_to :list
  # before_validation :set_default_position, on: :create

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

  protected

  # def set_default_position
  #   self.position = list.listed_items.length
  #   true
  # end
end
