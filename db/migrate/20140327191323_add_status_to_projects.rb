class AddStatusToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :status, :string, :null => false, :default => "Incomplete"
  end
end
