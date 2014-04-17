class RemovePriorityFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :priority
  end
end
