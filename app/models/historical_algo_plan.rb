class HistoricalAlgoPlan < ApplicationRecord
	belongs_to :organisation
	belongs_to :job, dependent: :destroy
end
