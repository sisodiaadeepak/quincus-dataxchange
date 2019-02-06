class User < ApplicationRecord
	belongs_to :organisation
	has_one :vehicle
	has_secure_password
end
