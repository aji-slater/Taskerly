class Note < ApplicationRecord
  belongs_to :user
  has_many :listings, as: :listable, class_name: 'ListedItem'
  has_many :lists, through: :listings
  has_many :comments, as: :commentable

end
