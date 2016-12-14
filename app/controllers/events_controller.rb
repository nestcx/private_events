class EventsController < ApplicationController
	before_action :signed_in?, only: [:new, :create]

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.new(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to @event
		else
			flash[:danger] = "Error creating event"
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def index
		@events = Event.all
		@events_upcoming = @events.events_upcoming
		@previous_events = @events.previous_events
		@undetermined = @events.undetermined
	end

	private

	def event_params
		params.require(:event).permit(:title, :description)
	end

	def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
	
end