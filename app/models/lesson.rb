class Lesson < ApplicationRecord
    belongs_to :room
    has_many :teachers
end
