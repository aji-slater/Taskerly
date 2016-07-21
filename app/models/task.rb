class Task < ApplicationRecord
  include Listable

  belongs_to :user
  has_many :listings, as: :listable, class_name: 'ListedItem'
  has_many :lists, through: :listings
  has_many :stickings, as: :stickerable, class_name: 'StickeredItem'
  has_many :stickers, through: :stickings
  has_many :comments, as: :commentable

  default_scope { order('id ASC') }
end
