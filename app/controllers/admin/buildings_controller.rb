class Admin::BuildingsController < Admin::AdminController
    def index
        @buildings = Building.includes(:rooms).all
    end

    def show
        @building = Building.find(params[:id])
    end

    def update
        @building = Building.find(params[:id])
 
        if @building.update(building_params)
            redirect_to action: "index"
        else
            render 'show'
        end
    end

    def new
        @building = Building.new
    end

    def create
        @building = Building.new(building_params)

        if @building.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end

    def destroy
        Building.destroy(params[:id])
        redirect_to action: "index"
    end

private
  def building_params
    params.require(:building).permit(:title, :code)
  end
end
