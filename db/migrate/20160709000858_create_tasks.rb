class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer  :user_id, null: false
      t.string   :name
      t.datetime :due_date
      t.boolean  :state

      t.timestamps
    end
  end
end
