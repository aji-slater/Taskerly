class CreateListedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :listed_items do |t|
      t.integer  :listed_item_id, null: false, index: true
      t.string   :listed_item_type, index: true
      t.integer  :list_id, null: false, index: true

      t.timestamps
    end
  end
end
