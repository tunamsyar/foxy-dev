class ApplicationController < ActionController::Base
  include Pundit  
  protect_from_forgery with: :exception

  private

  def active_users_only
    redirect_to(new_user_session_path) && return unless user_signed_in?
  end
end
