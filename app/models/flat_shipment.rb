class FlatShipment < ApplicationRecord
	belongs_to :organisation
	belongs_to :job, dependent: :destroy
	belongs_to :vehicle
end
