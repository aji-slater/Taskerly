class Sticker < ApplicationRecord
  belongs_to :user, optional: true
  has_many :stickered_items, foreign_key: :sticker_id
  has_many :tasks, through: :stickered_items, source: :stickerable, source_type: 'Task'
  has_many :notes, through: :stickered_items, source: :stickerable, source_type: 'Note'
  has_many :lists, through: :stickered_items, source: :stickerable, source_type: 'List'
end
