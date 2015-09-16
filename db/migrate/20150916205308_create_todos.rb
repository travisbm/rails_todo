class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task, limit: 300
      t.boolean :complete, default: FALSE

      t.timestamps null: false
    end
  end
end
