class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :require_user

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:notice] = "You must be logged in to preform that action"
            redirect_to login_path
        end
    end

    def current_user
        @current_user ||= Student.find(session[:student_id]) if session[:student_id]
    end

end
