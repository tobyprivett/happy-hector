class SessionsController < ApplicationController
  skip_before_action :ensure_fa_user, only: [:create]

  def create
    session[:auth_user] =
      AuthUser.from_omniauth_hash(request.env['omniauth.auth'])

    redirect_to '/'
  end
end
