class Admin::RoomsController < Admin::AdminController
    def show
        @room = Room.find(params[:id])
        @building = @room.building;
    end

    def update
        @room = Room.find(params[:id])
        @room.update(room_params)
        render 'show'
    end

    def new
        @room = Room.new
        @building = Building.find(params[:prev_building_id])
    end

    def create
        room = Building.find(params[:prev_building_id]).rooms.new(room_params)
        if room.save
            redirect_to [:admin, room]
        else
            render 'new'
        end
    end

    def destroy
        building = Room.find(params[:id]).building;
        Room.destroy(params[:id])
        redirect_to [:admin, building]
    end

private
  def room_params
    params.require(:room).permit(:title, :code)
  end
end
