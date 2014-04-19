class ChangeProjectIdInTasks < ActiveRecord::Migration
  def change
  	change_column :tasks, :project_id, :integer, :null => false
  end
end
