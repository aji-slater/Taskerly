class StickeredItem < ApplicationRecord
  belongs_to :stickerable, polymorphic: true
  belongs_to :sticker
end
