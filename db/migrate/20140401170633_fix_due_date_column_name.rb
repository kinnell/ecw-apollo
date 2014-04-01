class FixDueDateColumnName < ActiveRecord::Migration
  def change
  	rename_column :projects, :duedate, :due_date
  	rename_column :tasks, :duedate, :due_date
  end
end

