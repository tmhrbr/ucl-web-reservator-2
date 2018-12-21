class Student < ApplicationRecord
    extend Enumerize

    has_many :student_assignments
    has_many :courses, through: :student_assignments

    enumerize :study_type, in: [:full_time, :part_time], default: :full_time
end
