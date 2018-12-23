class Teacher < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    has_many :lessons, dependent: :destroy
    
    has_many :teacher_assignments
    has_many :courses, through: :teacher_assignments, dependent: :destroy
end
