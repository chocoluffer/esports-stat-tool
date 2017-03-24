class Player < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :name, presence: true,
					length: {minimum: 6}

end
