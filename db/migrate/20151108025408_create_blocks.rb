class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
