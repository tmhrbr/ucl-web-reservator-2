class RoomsController < ApplicationController
    def index
        if (params[:l] != nil)
            @max_buildings_shown = params[:l].to_i;
        else 
            @max_buildings_shown = 8;
        end

        if (params[:building_id] == nil)
            @rooms = Room.includes(:building).all
        else
            @building = Building.find(params[:building_id] + "%")
            @rooms = @building.rooms.includes(:lessons)
        end

        if (params[:q] != nil)
            @rooms = @rooms.where("title LIKE ?", "#{params[:q]}%")
        end

        @rooms = @rooms.take(@max_buildings_shown);
    end
end
