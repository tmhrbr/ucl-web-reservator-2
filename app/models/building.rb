class Building < ApplicationRecord
    validates :title, presence: true

    has_many :rooms,  dependent: :destroy 
end
