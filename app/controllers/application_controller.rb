class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= Student.find(session[:student_id]) if session[:student_id]
    end

end
