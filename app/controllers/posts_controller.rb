class PostsController < ApplicationController
  before_action :load_post, only: %i(show edit update destroy)
  # before_action :authorize_by_cancan, only: %i(edit update destroy)
  load_and_authorize_resource

  def index
    @posts = Post.includes(:user, :comments).order(created_at: :desc).page(params[:page]).per 5
  end

  def new
  end

  def create
    @post = Post.create post_params.merge(user: current_user)

    if @post.valid?
      flash[:success] = "Create post success"
      redirect_to @post
    else
      flash[:danger] = "Create post fail"
      render :new
    end
  end

  def show
    @comments = @post.comments.includes(:user).order(created_at: :desc).page(params[:page]).per 3
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

  def destroy
    if @post.destroy
      flash[:success] = "Delele post success"
      redirect_to root_url
    else
      flash[:danger] = "Delele post fail"
      redirect_to @post
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

  # def authorize_by_cancan
  #   authorize! :manage, @post
  # end
end
