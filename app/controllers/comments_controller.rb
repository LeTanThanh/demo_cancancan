class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  load_and_authorize_resource

  def create
    @comment = Comment.create comment_params.merge user: current_user
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit :body, :post_id
  end
end
