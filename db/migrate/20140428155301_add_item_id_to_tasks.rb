class AddItemIdToTasks < ActiveRecord::Migration
  def change
  	   add_column :tasks, :item_id, :integer
  end
end
