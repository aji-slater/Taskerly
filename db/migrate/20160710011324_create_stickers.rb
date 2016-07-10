class CreateStickers < ActiveRecord::Migration[5.0]
  def change
    create_table :stickers do |t|
      t.integer  :user_id
      t.string   :name, null: false
      t.string   :color, null: false
      t.string   :shape, null: false

      t.timestamps
    end
  end
end
