class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer  :user_id, null: false, index: true
      t.string   :name, null: false
      t.boolean  :state, default: false, null: false
      t.datetime :due_date

      t.timestamps
    end
  end
end
