class Teacher < ApplicationRecord
    belongs_to :lesson
    has_many :teacher_assignments
    has_many :courses, through: :teacher_assignments
end
