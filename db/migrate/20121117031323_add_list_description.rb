class AddListDescription < ActiveRecord::Migration
  def up
    add_column :lists, :desc, :text
  end

  def down
    remove_column :lists, :desc
  end
end
