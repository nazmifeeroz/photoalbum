class Photo_album < ApplicationRecord

	belongs_to :model
	has_many :photos

end