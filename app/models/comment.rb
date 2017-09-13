class Comment < ApplicationRecord

	belongs_to :model
	belongs_to :photo

end