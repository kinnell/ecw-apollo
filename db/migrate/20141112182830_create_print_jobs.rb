class CreatePrintJobs < ActiveRecord::Migration
  def change
    create_table :print_jobs do |t|
      t.integer :project_id
      t.string :number
      t.string :name
      t.string :account
      t.string :printer
      t.integer :quantity
      t.decimal :rate
      t.decimal :total_quote
      t.decimal :rewards_percentage
      t.decimal :total_paid
      t.datetime :date_paid
      t.text :note

      t.timestamps

    end
  end
end
