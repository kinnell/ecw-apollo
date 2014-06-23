class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.belongs_to :noteable, polymorphic: true

      t.timestamps
    end
    add_index :notes, [:noteable_id, :noteable_type]
  end
end
