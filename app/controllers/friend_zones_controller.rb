class FriendZonesController < ApplicationController

  def new
    render :new
  end

  def create

    ActiveRecord::Base.transaction do
      f_zone = FriendZone.create!(
        user_id: current_user.id,
        group_name: params[:friend_zone][:group_name]
      )

      params[:friend_zone][:member].each do |member|
        FriendZoneMembership.create!(
          friend_zone_id: f_zone.id,
          friend_id: member
        )
      end
    end

   redirect_to current_user
  end

end
