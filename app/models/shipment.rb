class Shipment < ApplicationRecord
	belongs_to :organisation
	belongs_to :job
	belongs_to :pickup
	belongs_to :delivery
	belongs_to :vehicle
	has_many :boxes
end
