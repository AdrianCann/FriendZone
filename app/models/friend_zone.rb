class FriendZone < ActiveRecord::Base
  belongs_to :user
  has_many :friend_zone_memberships
  has_many :post_shares

  has_many :friends, through: :friend_zone_memberships, source: :member
  has_many :posts, through: :post_shares

  validates :group_name, presence: true


end
