class Organisation < ApplicationRecord
	has_many :jobs
	has_many :historical_algo_plans
	has_many :geocodes
	has_many :vehicles
	has_many :addresses
	has_many :pickups
	has_many :deliveries
	has_many :shipments
	has_many :boxes
	has_many :flatshipments
end
