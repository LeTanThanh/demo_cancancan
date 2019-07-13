class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied, with: :cancan_access_denied

  private

  def cancan_access_denied exception
    flash[:warning] = exception.message
    redirect_to root_url
  end

  def current_ability
    @current_ability ||= if current_admin
      Ability::AdminAbility.new(current_admin)
    else
      Ability::UserAbility.new(current_user)
    end
  end

  def authenticate_user!
    return super if current_user
    authenticate_admin!
  end
end
