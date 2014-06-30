class AddCreatedByToProjects < ActiveRecord::Migration

	class ::Project < ActiveRecord::Base
	end

	class ::User < ActiveRecord::Base
	end

	class ::Assignment < ActiveRecord::Base
	end

  def change
  	add_column :projects, :created_by, :integer
  	Project.reset_column_information

  	Project.all.each do |p|
  		p.update(created_by: (Assignment.where(project_id: p.id).first.try(:user_id)))
  	end
  end
end
