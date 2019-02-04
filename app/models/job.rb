class Job < ApplicationRecord
	belongs_to :organisation
	has_many :historical_algo_plans
	has_many :vehicles
	#has_many :flatshipments

	enum status: { created: 0, started: 1, complete: 2, error: 3 }
end
