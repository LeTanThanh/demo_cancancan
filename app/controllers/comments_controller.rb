class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  load_and_authorize_resource

  def create
    @comment = Comment.create comment_params.merge user: current_user

    if @comment.valid?
      flash[:success] = "Create comment success"
    else
      flash[:danger] = "Create comment fail"
    end

    redirect_back(fallback_location: root_url)
  end

  private

  def comment_params
    params.require(:comment).permit :body, :post_id
  end
end
