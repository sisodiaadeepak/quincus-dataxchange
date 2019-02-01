class QuincusDataxchangesController < ApplicationController
	def index
		
	end


	def get_users
		begin
			@users = User.all
			render status: 200, json: {
				    message: "success",
				    users: "#{@users}"
				  }.to_json
		
		rescue Exception => e
			ender status: 404, json: {
			    message: "Failed",
			    reason: "#{e}"
			  }.to_json
		end
	end
end
