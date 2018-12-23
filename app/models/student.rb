class Student < ApplicationRecord
    extend Enumerize

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    has_many :student_assignments
    has_many :courses, through: :student_assignments

    enumerize :study_type, in: [:full_time, :part_time], default: :full_time

    def self.full_name(student)
        student.first_name + " " + student.last_name
    end
end
