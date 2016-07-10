class CreateJots < ActiveRecord::Migration[5.0]
  def change
    create_table :jots do |t|
      t.integer :user_id, index: true
      t.string  :text

      t.timestamps
    end
  end
end
