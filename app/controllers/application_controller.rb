class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_fa_user

  def current_user
    AuthUser.new(session[:auth_user])
  end
  helper_method :current_user

  def logged_in?
    session[:auth_user]
  end
  helper_method :logged_in?

  private

  def ensure_fa_user
    logged_in? || redirect_to(new_session_path)
  end
end
