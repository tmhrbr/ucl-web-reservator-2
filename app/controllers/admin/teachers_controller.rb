class Admin::TeachersController < Admin::AdminController
    def index
        @teachers = Teacher.all
    end

    def show
        @teacher = Teacher.find(params[:id])
    end

    def update
        @teacher = Teacher.find(params[:id])
 
        if @teacher.update(teacher_params)
            redirect_to action: "index"
        else
            render 'show'
        end
    end

    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)

        if @teacher.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end

    def destroy
        Teacher.destroy(params[:id])
        redirect_to action: "index"
    end

private
  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, course_ids: [])
  end
end
