class Admin::StudentsController < Admin::AdminController
    def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
 
        if @student.update(student_params)
            redirect_to action: "index"
        else
            render 'show'
        end
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new (student_params)
        
        if @student.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end

    def destroy
        Student.destroy(params[:id])
        redirect_to action: "index"
    end

private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :study_type, course_ids: [])
  end
end
