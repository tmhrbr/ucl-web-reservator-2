class Course < ApplicationRecord
    extend Enumerize

    enumerize :language, in: [:czech, :english], default: :english
    enumerize :study_type, in: [:full_time, :part_time], default: :full_time

    has_many :teacher_assignments
    has_many :teachers, through: :teacher_assignments

    has_many :student_assignments
    has_many :students, through: :student_assignments
    
    has_many :lessons

    belongs_to :language
    belongs_to :study_type
end
