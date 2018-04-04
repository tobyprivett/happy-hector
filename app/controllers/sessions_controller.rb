class SessionsController < ApplicationController
  skip_before_action :ensure_fa_user, only: [:new, :create]

  def new; end

  def show
    render json: session[:auth_user]
  end

  def create
    session[:auth_user] =
      AuthUser.from_omniauth_hash(request.env['omniauth.auth'])

    redirect_to '/'
  end

  def destroy
    session[:auth_user] = nil

    redirect_to '/'
  end
end
