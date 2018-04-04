class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_fa_user

  def current_user
    AuthUser.new(email: session[:auth_email])
  end

  private

  def ensure_fa_user
    session[:auth_email] || redirect_to('/auth/freeagent_auth/')
  end
end
