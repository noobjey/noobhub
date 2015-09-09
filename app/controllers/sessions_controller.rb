class SessionsController < ApplicationController
  def create

    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    redirect_to dashboard_path user
  end
end
