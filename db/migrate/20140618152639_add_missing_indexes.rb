class AddMissingIndexes < ActiveRecord::Migration
   def change
     add_index :assignments, :user_id
     add_index :assignments, :project_id
     add_index :assignments, [:project_id, :user_id]
     add_index :comments, :user_id
     add_index :tasks, :item_id
   end
end