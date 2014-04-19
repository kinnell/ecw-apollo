class AddStarredToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :starred, :boolean, :null => false, :default => false
  end
end
