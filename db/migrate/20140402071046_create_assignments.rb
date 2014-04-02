class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :project_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
