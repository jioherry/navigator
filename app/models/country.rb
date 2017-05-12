class Country < ApplicationRecord
	
	validates :name, presence: false

	has_many :posts

end
