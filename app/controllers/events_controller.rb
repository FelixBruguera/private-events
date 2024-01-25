class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.create(event_params.except(:invited))
      User.find(current_user.id).events << @event
      if event_params[:private] == '1'
        event_params[:invited].each do |user|
          EventAttendance.create(attendee: user, attended_event: @event.id)
        end
      end
      redirect_to event_path(@event.id)
    end

    def edit
        @event = Event.find(params[:id])
      end
    
      def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
          redirect_to @event
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @event = Event.find(params[:id])
        EventAttendance.destroy_by(attended_event:@event.id)
        @event.destroy
        redirect_to root_path
      end

    private

    def event_params
        params.require(:event).permit(:name, :location, :date, :creator, :private, :invited => [])
    end

end
