class FlatShipment < ApplicationRecord
	belongs_to :organisation
	belongs_to :job
	belongs_to :vehicle
end
