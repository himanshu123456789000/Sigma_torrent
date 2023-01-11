class SessionsController < ApplicationController
    def new
        if logged_in?
          flash[:danger] = "You are Logged in please log out."
          redirect_to root_path
      end
    end
    
      def create
        admin = Admin.find_by(email: params[:session][:email].downcase)
        session[:current_admin_id] = admin.id
        if admin && admin.authenticate(params[:session][:password])
          log_in admin
          redirect_to admin
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
      end
    
      def destroy
        log_out
        redirect_to root_url
      end
end
