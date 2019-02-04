class Api::GeocodesController < ApplicationController

	def geocode_file
		begin
			if params[:geocode_file].present?
				# Read Csv file 
				require 'csv'
				csv_text = File.read("#{params[:geocode_file]}")
				csv = CSV.parse(csv_text, :headers => true)
			
				csv.each do |row|
					# Remove key value pair which contain nil and unnecessary values
					flatshipment_params = row.to_hash.reject { |k,v| v.nil? }
					rejected_column = [ "DELIVERY_COMMIT_TIME_TIMEZONE", "DELIVERY_POSTCODE", "DELIVERY_CITY", "DELIVERY_COUNTRY", "PICKUP_DATE", "PICKUP_COMMIT_TIME_TIMEZONE", "PICKUP_POSTCODE", "PICKUP_CITY", "PICKUP_COUNTRY"]
					rejected_column.map { |k| flatshipment_params.delete(k)}

					# make key in downcase
					flatshipment_new_params = {}
					flatshipment_params.to_hash.each_pair do |k,v|
						flatshipment_new_params.merge!({k.downcase => v}) 
					end
					@batch_id = SecureRandom.uuid
					flatshipment_new_params.merge!("batch_id"=>"#{@batch_id}", "organisation_id" => "#{current_user.organisation.id}")

					FlatShipment.create!(flatshipment_new_params)
				end
				render status: 200, json: {
					    message: "success",
					    batch_id: "#{@batch_id}"
					  }.to_json
			else
				render status: 200, json: {
					    message: "File Not Found"
					  }.to_json
			end
		rescue Exception => e

			render status: 200, json: {
					    message: "#{e}"
					  }.to_json
		end
	end

end
