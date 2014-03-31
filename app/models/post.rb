class Post < ActiveRecord::Base
  has_many :post_shares
  belongs_to :user
  has_many :links
end
