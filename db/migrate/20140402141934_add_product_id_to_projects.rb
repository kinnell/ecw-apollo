class AddProductIdToProjects < ActiveRecord::Migration
  def change
  	   add_column :projects, :product_id, :integer
    	add_index :projects, :product_id
  end
end
