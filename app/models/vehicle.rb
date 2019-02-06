class Vehicle < ApplicationRecord
	belongs_to :organisation, optional: true
	belongs_to :job, optional: true
	has_many :flatshipments
	belongs_to :driver, class_name: 'User'
	
	validates :remote_id, :uniqueness => true
end
