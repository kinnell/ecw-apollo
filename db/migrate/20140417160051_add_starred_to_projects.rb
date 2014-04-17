class AddStarredToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :starred, :boolean, :null => false, :default => false
  end
end
