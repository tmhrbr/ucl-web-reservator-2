class Admin::DashboardsController < Admin::AdminController
    def index 
        @sizes = {
            buildings: Building.count,
            courses: Course.count,
            students: Student.count,
            teachers: Teacher.count
        }
    end
end
