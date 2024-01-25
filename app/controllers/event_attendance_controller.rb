class EventAttendanceController < ApplicationController

    def new
        @attendance = EventAttendance.new
    end

    def show
        p 'event attendance controller'
        p permited_params
        @attendance = EventAttendance.create(permited_params)
        redirect_to event_path(@attendance.attended_event)
    end

    def destroy
    EventAttendance.destroy_by(attendee: current_user.id, attended_event: params[:id])
    redirect_to event_path(params[:id])
    end

    private

    def permited_params
        params.require(:attendance).permit(:attendee, :attended_event)
    end

end
