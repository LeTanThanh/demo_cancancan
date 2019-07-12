class PostsController < ApplicationController
  before_action :load_post, only: %i(show edit update)

  def index
    @posts = Post.page(params[:page]).per 5
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = "Update post success"
      redirect_to @post
    else
      flash[:danger] = "Update post fail"
      render :edit
    end
  end

  private

  def load_post
    return if @post = Post.find_by(id: params[:id])
     
    flash[:warning] = "Post not found"
    redirect_to root_url
  end

  def post_params
    params.require(:post).permit :title, :body
  end
end
