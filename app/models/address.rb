class Address < ApplicationRecord
	belongs_to :organisation
	has_many :pickups
	has_many :deliveries
end
