class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @share = current_user.shares.build(post: @post)
    
    if @share.save
      redirect_to @post, notice: 'Post shared successfully.'
    else
      redirect_to @post, alert: 'You have already shared this post.'
    end
  end

  def destroy
    @share = current_user.shares.find_by(post: @post)
    
    if @share&.destroy
      redirect_to @post, notice: 'Post unshared successfully.'
    else
      redirect_to @post, alert: 'You have not shared this post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end 