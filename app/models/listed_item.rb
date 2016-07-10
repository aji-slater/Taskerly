class ListedItem < ApplicationRecord
  belongs_to :listable, polymorphic: true
  belongs_to :list
  before_validation :set_default_position

  protected

  def set_default_position
    self.position = list.listed_items.length
    true
  end
end
