class Admin::CoursesController < Admin::AdminController
    def index
        @courses = Course.includes(:students, :teachers).all
    end

    def show
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
 
        if @course.update(course_params)
            redirect_to action: "index"
        else
            render 'show'
        end
    end

    def new
        @course = Course.new
    end

    def create
        if Course.create(course_params)
            redirect_to action: "index"
        else
            render 'new'
        end
    end

    def destroy
        Course.destroy(params[:id])
        redirect_to action: "index"
    end

private
  def course_params
    params.require(:course).permit(:title, :code, :language, :study_type)
  end
end
