class Geocode < ApplicationRecord
	belongs_to :organisation
	has_one :geocode_file

	enum status: { started: 0, waiting: 1, complete: 2, error: 3 }
end
