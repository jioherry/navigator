class CreateWriters < ActiveRecord::Migration[5.0]
  def change
    create_table :writers do |t|
    	t.string :name
    	t.string :Introduction
    	t.string :photo
    	t.string :experience
      t.timestamps
    end
  end
end
