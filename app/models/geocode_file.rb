class GeocodeFile < ApplicationRecord
	  has_one_attached :file_data
	  belongs_to :geocode
end
