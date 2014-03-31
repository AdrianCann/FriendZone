class FriendZoneMembership < ActiveRecord::Base
  belongs_to :friend_zone

  belongs_to(
      :member,
      class_name: "User",
      foreign_key: :friend_id,
      primary_key: :id
    )

end
