class AddUserIdToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :user_id, :integer
    add_index :blocks, :user_id
  end
end
