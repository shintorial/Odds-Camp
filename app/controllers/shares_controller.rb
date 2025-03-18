class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @share = current_user.shares.build(post: @post)
    
    if @share.save
      redirect_to @post, notice: 'Post shared!'
    else
      redirect_to @post, alert: 'Unable to share post.'
    end
  end

  def destroy
    @share = current_user.shares.find_by(post: @post)
    
    if @share&.destroy
      redirect_to @post, notice: 'Share removed.'
    else
      redirect_to @post, alert: 'Unable to remove share.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end 