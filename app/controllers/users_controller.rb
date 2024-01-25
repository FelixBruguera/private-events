class UsersController < ApplicationController

    def show
        if params[:id] == 'sign_out' then return sign_out_and_redirect(current_user) end
        @user_events = EventAttendance.where(attendee:current_user.id).includes(:event).order('events.date')
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to new_user_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
