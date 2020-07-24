class ApplicationController < ActionController::Base

  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end

  # This should be handled with roles. perhaps pundit or some other lightweight gem
  def admin_access
    redirect_to root_path unless logged_in? && current_user.admin?
  end
end
