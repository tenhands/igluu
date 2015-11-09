class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps null: false
    end
  end
end
