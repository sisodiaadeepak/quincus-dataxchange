class FlatShipment < ApplicationRecord
	belongs_to :organisation
	belongs_to :job, dependent: :destroy, optional: true
	belongs_to :vehicle, optional: true
	validates :delivery_address, presence: true
end
