class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = current_user.likes.build(post: @post)
    
    if @like.save
      redirect_to @post, notice: 'Post liked successfully.'
    else
      redirect_to @post, alert: 'You have already liked this post.'
    end
  end

  def destroy
    @like = current_user.likes.find_by(post: @post)
    
    if @like&.destroy
      redirect_to @post, notice: 'Post unliked successfully.'
    else
      redirect_to @post, alert: 'You have not liked this post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end 