class CreateListedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :listed_items do |t|
      t.integer  :user_id, null: false
      t.integer  :listable_id, null: false, index: true
      t.string   :listable_type, index: true
      t.integer  :list_id, null: false, index: true

      t.timestamps
    end
  end
end
