class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer  :user_id, null: false
      t.string   :name
      t.text     :text

      t.timestamps
    end
  end
end
