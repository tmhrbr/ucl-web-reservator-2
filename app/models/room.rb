class Room < ApplicationRecord
    validates :title, presence: true
    
    belongs_to :building
    has_many :lessons, dependent: :destroy 
end
