class ChangeUserIdInTasks < ActiveRecord::Migration
  def change
  	change_column :tasks, :user_id, :integer, :null => false
  end
end
