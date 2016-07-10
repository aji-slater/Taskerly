class CreateStickeredItems < ActiveRecord::Migration[5.0]
  def change
    create_table :stickered_items do |t|
      t.references :stickerable, polymorphic: true, index: true
      t.integer    :sticker_id, null: false, index: true

      t.timestamps
    end
  end
end
