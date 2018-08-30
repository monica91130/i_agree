class Agree < ApplicationRecord

	belongs_to :user
	belongs_to :post
	# belongs_to :request

	# validates :request_id, :uniqueness => {:scope => :user_id}
	validates :post_id, :uniqueness => {:scope => :user_id}
end
