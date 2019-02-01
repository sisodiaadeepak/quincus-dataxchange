class Organisation < ApplicationRecord
	has_many :jobs
	has_many :historical_algo_plans
	has_many :geocodes
	has_many :vehicles
	has_many :addresses
	has_many :flatshipments
	has_many :users
end
