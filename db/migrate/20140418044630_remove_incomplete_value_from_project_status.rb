class RemoveIncompleteValueFromProjectStatus < ActiveRecord::Migration
  def change
  		change_column_default :projects, :status, "In Queue"
  	end
end
