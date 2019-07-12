class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied, with: :cancan_access_denied

  private

  def cancan_access_denied exception
    flash[:warning] = exception.message
    redirect_to root_url
  end
end
