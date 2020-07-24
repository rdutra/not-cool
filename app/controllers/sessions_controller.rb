# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create destroy omniauth]

  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  def omniauth
    # I Tried not saving the user at all but then it makes it hard to determine
    # if it's an admin that should see the complaints or a regular user that can't
    @user = User.from_omniauth(auth)
    @user.save(touch: false) # don't update the updated_at timestamp
    session[:user_id] = @user.id
    redirect_to root_url, notice: 'Validated'
  end

  def auth
    request.env['omniauth.auth']
  end
end
