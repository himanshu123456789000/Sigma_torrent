class SessionsController < ApplicationController
    def new
        if logged_in?
          flash[:danger] = "You are Logged in please log out."
          redirect_to browses_path
      end
    end
    
      def create
        admin = Admin.find_by(email: params[:session][:email].downcase)
        if admin && admin.authenticate(params[:session][:password])
          log_in admin
          redirect_to admin, notice: "Logged in!"
        else
          flash[:danger] = 'Invalid email/password combination'
          # render 'new'
          redirect_to "/login"
        end
      end
    
      def destroy
        log_out
        redirect_to login_url
      end
end
