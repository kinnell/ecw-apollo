class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false, :default => ""

      t.timestamps
    end
  end
end
