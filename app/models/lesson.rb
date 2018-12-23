class Lesson < ApplicationRecord
    belongs_to :room
    belongs_to :course
    belongs_to :teacher

    def day
        DateTime.parse(self.start_at.to_s).cwday
    end
end
