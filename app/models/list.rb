class List < ApplicationRecord
  belongs_to :user
  has_many :listed_items, foreign_key: :list_id
  has_many :tasks, through: :listed_items, source: :listable, source_type: 'Task'
  has_many :comments, as: :commentable

end
