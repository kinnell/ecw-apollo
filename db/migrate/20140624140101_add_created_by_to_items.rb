class AddCreatedByToItems < ActiveRecord::Migration

	class ::Item < ActiveRecord::Base
	end

	class ::Project < ActiveRecord::Base
	end

	class ::User < ActiveRecord::Base
	end

	class ::Assignment < ActiveRecord::Base
	end

  def change
  	add_column :items, :created_by, :integer
  	Item.reset_column_information

  	Item.all.each do |i|
  		i.update(created_by: (Assignment.where(project_id: i.project_id).first.try(:user_id)))
  	end
  end

end
