class CreateFriendZoneMemberships < ActiveRecord::Migration
  def change
    create_table :friend_zone_memberships do |t|
      t.integer :friend_zone_id
      t.integer :friend_id

      t.timestamps
    end

    add_index :friend_zone_memberships, :friend_zone_id
    add_index :friend_zone_memberships, :friend_id
  end
end
