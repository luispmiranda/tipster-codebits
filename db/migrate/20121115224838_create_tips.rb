class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :list_id

      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
