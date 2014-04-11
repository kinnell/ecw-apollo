class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :null => false, :default => ""
      t.string :type, :null => false, :default => ""

      t.timestamps
    end
  end
end
