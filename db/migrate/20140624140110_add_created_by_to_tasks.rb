class AddCreatedByToTasks < ActiveRecord::Migration

	class ::Task < ActiveRecord::Base
	end

  def change
  	add_column :tasks, :created_by, :integer
  	Task.reset_column_information

  	Task.all.each do |t|
  		t.update(created_by: t.user_id)
  	end

  end

end
