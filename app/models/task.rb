class Task < ApplicationRecord
  belongs_to :user
  has_many :listings, as: :listable, class_name: 'ListedItem'
  has_many :lists, through: :listings
  has_many :stickings, as: :stickerable, class_name: 'StickeredItem'
  has_many :stickers, through: :stickings
  has_many :comments, as: :commentable

  def position_on(list)
    on_which_list = listings.where(list: list, listable_id: id, listable_type: 'Task')[0]
    on_which_list.position
  end
end
