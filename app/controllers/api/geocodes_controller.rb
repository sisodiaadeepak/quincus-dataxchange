class Api::GeocodesController < ApplicationController

	def geocode_file
		begin
			if params[:geocode_file].present?
				# Read Csv file 
				require 'csv'
				csv_text = params[:geocode_file].tempfile
				csv = CSV.parse(csv_text, :headers => true)
			
				@batch_id = SecureRandom.uuid
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
					flatshipment_new_params.merge!("batch_id"=>"#{@batch_id}", "organisation_id" => "#{current_user.organisation.id}")

					FlatShipment.create!(flatshipment_new_params)
				end
				render status: 200, json: {
					    batch_id: "#{@batch_id}",
					    organisation_id: "#{current_user.organisation.id}",
					    status_code: "started",
					    addresses: [],
					    geocode: nil,
					    geocode_errors: nil,
					    date_created: "#{FlatShipment.last.created_at.strftime(( "%Y-%m-%dT%H:%M:%S%z"))}",
					    date_updated: "#{FlatShipment.last.updated_at.strftime(( "%Y-%m-%dT%H:%M:%S%z"))}"
					  }.to_json
			else
				render  json: {
					    	message: "File Not Found"
						}.to_json
			end
		rescue Exception => e

			render json: {
					    message: "#{e}"
					}.to_json
		end
	end


	def get_flatshipment
		begin
			if params[:batch_id].present?
				@flatshipments = FlatShipment.where(batch_id: params[:batch_id])
				
				render status: 200, json: {
					    batch_id: "#{params[:batch_id]}",
					    organisation:  "#{current_user.organisation.id}",
					    status_code: "complete",
					    addresses: "#{@flatshipments.to_json}",
					    geocode: "#{@flatshipments.to_json}",
					    date_created: "#{@flatshipments.last.created_at.strftime(( "%Y-%m-%dT%H:%M:%S%z"))}",
					    date_updated: "#{@flatshipments.last.updated_at.strftime(( "%Y-%m-%dT%H:%M:%S%z"))}"
					  }
			end
		rescue Exception => e
			render json: {
						message: "#{e}",
					}.to_json
		end
	end

end
