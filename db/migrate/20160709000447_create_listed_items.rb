class CreateListedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :listed_items do |t|
      t.references :listable, polymorphic: true, index: true
      t.integer  :list_id, null: false, index: true
      t.integer  :position, default: 0

      t.timestamps
    end
  end
end
