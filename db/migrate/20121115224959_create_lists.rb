class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id

      t.text :title

      t.timestamps
    end
  end
end
