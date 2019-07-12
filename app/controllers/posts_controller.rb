class PostsController < ApplicationController
  before_action :load_post, only: :show

  def index
    @posts = Post.page(params[:page]).per 5
  end

  def show
  end

  private

  def load_post
    return if @post = Post.find_by(id: params[:id])
     
    flash[:warning] = "Post not found"
    redirect_to root_url
  end
end
