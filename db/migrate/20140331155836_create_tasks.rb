class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :duedate
      t.boolean :completed, :null => false, :default => false

      t.timestamps
    end
  end
end
