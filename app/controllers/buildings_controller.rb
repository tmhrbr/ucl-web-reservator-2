class BuildingsController < ApplicationController
    def index
        if (params[:l] != nil)
            @max_buildings_shown = params[:l].to_i;
        else 
            @max_buildings_shown = 20;
        end

        @buildings = Building.all

        if (params[:q] != nil && params[:q] != "")
            @buildings = @buildings.where("title LIKE ?", "#{params[:q]}%")
        end

        @buildings = @buildings.take(@max_buildings_shown)
    end
end
