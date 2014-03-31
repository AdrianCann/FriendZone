class PostsController < ApplicationController
  def new
    @user = current_user

    render :new
  end

  def create
    ActiveRecord::Base.transaction do
      post = current_user.posts.create!(post_params)
      post.links.create!(link_params)


    end


  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def link_params


  end

end
