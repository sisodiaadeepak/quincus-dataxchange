class Vehicle < ApplicationRecord
	belongs_to :organisation
	belongs_to :job
	has_many :shipments
	has_many :flatshipments
	
	validates :remote_id, :uniqueness => true
end
