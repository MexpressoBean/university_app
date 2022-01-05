class SessionsController < ApplicationController

    def new
        
    end

    def create
        student = Student.find_by(email: params[:sessions][:email].downcase)
        if student && student.authenticate(params[:sessions][:password])
            session[:student_id] = student.id
            flash[:notice] = "Successful log in"
            redirect_to student
        else
            flash.now[:notice] = "Something was wrong with the information"
            render 'new'
        end
    end

    def destroy
        session[:student_id] = nil
        flash[:notice] = "Successful log out"
        redirect_to root_path
    end
end