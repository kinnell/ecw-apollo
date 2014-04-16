class AddAssignedByToProjects < ActiveRecord::Migration
	def change
  		add_column :projects, :assigned_by, :string
  	end
end
