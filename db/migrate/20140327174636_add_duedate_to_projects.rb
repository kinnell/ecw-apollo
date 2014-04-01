class AddDuedateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :duedate, :datetime
  end
end
