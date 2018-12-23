# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Array.new(5).each_with_index { |val,i|
    building = Building.create!({title: "Building Title ##{i}", code: "BuildingCode#{i}"})
    teacher = Teacher.create!({first_name: "Master", last_name: "Teacher #{i}", email: "masterteacher#{i}@email.com"})
    course = Course.create!({title: "Course Title ##{i}", code: "CourseCode#{i}", language: :english, study_type: :full_time})
    Student.create!({first_name: "Mister", last_name: "Student #{i}", email: "misterstudent#{i}@email.com", study_type: :full_time})

    Array.new(5).each_with_index { |val,j|
        room = Room.new({title: "Room Title ##{j}", code: "RoomCode#{j}", building_id: building.id})
        
        Array.new(5).each_with_index { |val,k|
            now = DateTime.now
            start_at = DateTime.new(now.year, now.month, now.day + k, 7, 0)
            end_at = DateTime.new(now.year, now.month, now.day + k, 12, 0)
            room.lessons.new(teacher_id: teacher.id, course_id: course.id, start_at: start_at, end_at: end_at, durration: k)
        }

        building.rooms << room
    }

    building.save!
}