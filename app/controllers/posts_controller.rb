class PostsController < ApplicationController
  def new
    @user = current_user

    render :new
  end

  def create
    ActiveRecord::Base.transaction do
      Post.create!()


    end


  end

end
