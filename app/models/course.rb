class Course < ApplicationRecord
    extend Enumerize

    validates :title, presence: true
    validates :language, presence: true
    validates :study_type, presence: true

    enumerize :language, in: [:czech, :english], default: :english
    enumerize :study_type, in: [:full_time, :part_time], default: :full_time

    has_many :teacher_assignments
    has_many :teachers, through: :teacher_assignments, dependent: :destroy

    has_many :student_assignments
    has_many :students, through: :student_assignments, dependent: :destroy
    
    has_many :lessons, dependent: :destroy
end
