class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private
  def logged_in_admin
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
