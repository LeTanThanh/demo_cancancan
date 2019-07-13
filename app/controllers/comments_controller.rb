class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i(create edit update)
  load_and_authorize_resource

  def create
    @comment = Comment.create comment_params.merge user: current_user
  end

  def edit
  end

  def update
    @comment.update_attributes comment_params
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit :body, :post_id
  end
end
