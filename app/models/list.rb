class List < ApplicationRecord
  belongs_to :user
  has_many :listed_items, foreign_key: :list_id
  has_many :tasks, through: :listed_items, source: :listable, source_type: 'Task'
  has_many :notes, through: :listed_items, source: :listable, source_type: 'Note'
  has_many :comments, as: :commentable
  has_many :stickings, as: :stickerable, class_name: 'StickeredItem'
  has_many :stickers, through: :stickings
end
