class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :username

  def username
    return session[:username]
  end
end
