class SchedulesController < ApplicationController
    def index
        @schedule = Room.find(params[:room_id]).lessons;
        @room = Room.find(params[:room_id]);
    end
end
