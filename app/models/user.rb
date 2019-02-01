class User < ApplicationRecord
	belongs_to :organisation
	has_secure_password
end
