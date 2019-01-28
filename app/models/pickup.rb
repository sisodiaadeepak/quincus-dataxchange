class Pickup < ApplicationRecord
	belongs_to :organisation
	belongs_to :address
	has_many :shipments
end
