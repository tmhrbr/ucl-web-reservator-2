class Admin::LessonsController < Admin::AdminController
    def show
        @lesson = Lesson.find(params[:id])
        @room = @lesson.room
        @building = @room.building
    end

    def update
        @lesson = Lesson.find(params[:id])
        if (@lesson.update(lesson_params))
            redirect_to admin_room_path(@lesson.room)
        else
            render 'show'
        end
    end

    def new
        @lesson = Lesson.new
        @room = Room.find(params[:prev_room_id])
    end

    def create
        @lesson = Room.find(params[:prev_room_id]).lessons.new(lesson_params)
        if @lesson.save
            redirect_to admin_room_path(@lesson.room)
        else
            render 'new'
        end
    end

    def destroy
        room = Lesson.find(params[:id]).room;
        Lesson.destroy(params[:id])
        redirect_to [:admin, room]
    end

private

  def lesson_params
    params.require(:lesson).permit(:start_at, :end_at, :durration, :course_id, :teacher_id)
  end
end
