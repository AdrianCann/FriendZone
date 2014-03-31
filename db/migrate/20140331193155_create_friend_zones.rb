class CreateFriendZones < ActiveRecord::Migration
  def change
    create_table :friend_zones do |t|
      t.string :group_name
      t.integer :user_id

      t.timestamps
    end

    add_index :friend_zones, :user_id
  end
end
