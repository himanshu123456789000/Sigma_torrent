class ApplicationController < ActionController::Base
    include SessionsHelper

    # def current_admin
    #    @current_admin = session[:current_admin_id] && Admin.find(session[:current_admin_id])
    # end

    
    private
    def logged_in_admin
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
end
