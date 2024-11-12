class AddLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :likeable_id
      t.string :likeable_type
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
    add_index :likes, [ :likeable_type, :likeable_id ], unique: true
  end
end
