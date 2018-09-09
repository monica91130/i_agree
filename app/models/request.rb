class Request < ApplicationRecord
	belongs_to :user
	has_many :users, through: :agrees
	has_many :agrees, dependent: :destroy
end
