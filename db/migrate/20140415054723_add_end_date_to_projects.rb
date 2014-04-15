class AddEndDateToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :end_date, :datetime
  end
end