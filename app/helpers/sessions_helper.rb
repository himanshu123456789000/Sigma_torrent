module SessionsHelper
    def log_in(admin)
        session[:admin_id] = admin.id
      end
    
      def current_admin
        if session[:admin_id]
          @current_admin ||= Admin.find_by(id: session[:admin_id])
        end
      end
    
      def logged_in?
        !current_admin.nil?
      end
    
      def log_out
        session.delete(:admin_id)
        @current_admin = nil
      end
    
      def current_admin?(admin)
        admin == current_admin
      end
    
      def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
      end
    
      def store_location
        session[:forwarding_url] = request.original_url if request.get?
      end
end
