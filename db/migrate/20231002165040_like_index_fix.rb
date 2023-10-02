class LikeIndexFix < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, [:likeable_type, :likeable_id], unique: true
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
  end
end
