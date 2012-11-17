class DeleteListTypeField < ActiveRecord::Migration
  def up
    remove_column :lists, :type
  end

  def down
    add_column :lists, :type, :string
  end
end
